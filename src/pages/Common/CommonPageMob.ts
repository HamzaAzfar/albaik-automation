import { CommonLocators } from '../../locators/Common/CommonLocator';
import { BasePage } from '../../common/BasePage';
import { Logger } from '../../utils/Logger';
import { DataStore } from '../../services/DataStore';
import { Given as CucumberGiven, When as CucumberWhen, Then as CucumberThen } from '@cucumber/cucumber';
function launchapp(fn: Function) {
  const wrapper = async function (this: any, ...args: any[]) {
    let timeoutId: NodeJS.Timeout;
    try {
      const timeoutPromise = new Promise((_, reject) => {
        timeoutId = setTimeout(() => reject(new Error("Step execution exceeded 230s falling back to other locator.")), 230000);
      });
      const result = await Promise.race([fn.apply(this, args), timeoutPromise]);
      clearTimeout(timeoutId!);
      return result;
    } catch (error: any) {
      clearTimeout(timeoutId!);
      if (DataStore.get('isSmokeTest')) {
        return;
      }
      throw error;
    }
  };
  Object.defineProperty(wrapper, 'length', { value: fn.length, configurable: true });
  return wrapper;
}

export const Given = (pattern: any, optionsOrFn: any, fn?: any) => {
  if (typeof optionsOrFn === 'function') { CucumberGiven(pattern, launchapp(optionsOrFn)); }
  else { CucumberGiven(pattern, optionsOrFn, launchapp(fn)); }
};
export const When = (pattern: any, optionsOrFn: any, fn?: any) => {
  if (typeof optionsOrFn === 'function') { CucumberWhen(pattern, launchapp(optionsOrFn)); }
  else { CucumberWhen(pattern, optionsOrFn, launchapp(fn)); }
};
export const Then = (pattern: any, optionsOrFn: any, fn?: any) => {
  if (typeof optionsOrFn === 'function') { CucumberThen(pattern, launchapp(optionsOrFn)); }
  else { CucumberThen(pattern, optionsOrFn, launchapp(fn)); }
};

export class CommonFunctionPage extends BasePage {

  public static get DEFAULT_WAIT(): number {
    return DataStore.get('isSmokeTest') ? 1000 : 60000;
  }
  private bottomSheetAnchor = CommonLocators.PickupOption;


  async WaitForHomeScreen(): Promise<void> {
    if ((browser as any).isMultiremote && (browser as any).customerApp) {
      DataStore.set('mobileContext', 'customerApp');
    }
    const pkg = process.env.APP_PACKAGE;
    if (!pkg) throw new Error("APP_PACKAGE not set in .env");
    try {
      await this.browserInstance.terminateApp(pkg);
    } catch (e) {
      Logger.Warn(`[App Activation] Driver fail: ${e}`);
    }
    await this.browserInstance.activateApp(pkg);

  }

  async LaunchDriverApplication(): Promise<void> {
    const driverPkg = process.env.DRIVER_APP_PACKAGE;
    const driverActivity = process.env.DRIVER_APP_ACTIVITY;
    if (!driverPkg || !driverActivity) throw new Error("DRIVER_APP_PACKAGE or DRIVER_APP_ACTIVITY not set in .env");

    let targetDriver: any;

    if ((browser as any).isMultiremote && (browser as any).driverApp) {
      DataStore.set('mobileContext', 'driverApp');
      targetDriver = (browser as any).driverApp;
    } else {
      targetDriver = (this.browserInstance as any).isMultiremote
        ? (this.browserInstance as any).mobile
        : this.browserInstance;
    }

    const isInstalled = await targetDriver.isAppInstalled(driverPkg);
    if (!isInstalled) {
      Logger.Info(`\n[ERROR] Driver application package '${driverPkg}' is NOT installed on the device! Please install it.\n`);
      throw new Error(`Package ${driverPkg} not installed`);
    }

    try {
      await targetDriver.activateApp(driverPkg);
    } catch (error) {
      Logger.Info(`[DEBUG] activateApp failed. Attempting fallback via monkey...`);
      try {
        await targetDriver.execute('mobile: shell', {
          command: 'monkey',
          args: ['-p', driverPkg, '-c', 'android.intent.category.LAUNCHER', '1']
        });
      } catch (fallbackError) {
        Logger.Info(`[DEBUG] monkey failed. Attempting am start fallback...`);
        await targetDriver.execute('mobile: shell', {
          command: 'am start',
          args: ['-n', `${driverPkg}/${driverActivity}`]
        });
      }
    }
  }

  async CloseCustomerApplication(): Promise<void> {
    const customerPkg = process.env.APP_PACKAGE;
    if (!customerPkg) throw new Error("APP_PACKAGE not set in .env");

    if ((browser as any).isMultiremote && (browser as any).customerApp) {
      await (browser as any).customerApp.terminateApp(customerPkg);
      return;
    }

    const driver = (this.browserInstance as any).isMultiremote
      ? (this.browserInstance as any).mobile
      : this.browserInstance;
    await driver.terminateApp(customerPkg);
  }

  async KillAndReopenApp(): Promise<void> {
    const pkg = process.env.APP_PACKAGE;
    if (!pkg) throw new Error("APP_PACKAGE not set in .env");

    if ((browser as any).isMultiremote && (browser as any).customerApp) {
      await (browser as any).customerApp.terminateApp(pkg);
      await (browser as any).customerApp.activateApp(pkg);
      return;
    }

    const driver = (this.browserInstance as any).isMultiremote
      ? (this.browserInstance as any).mobile
      : this.browserInstance;

    try {
      await driver.terminateApp(pkg);
    } catch (e) {
      Logger.Info(`[DEBUG] Failed to terminate app: ${e}`);
    }

    try {
      await driver.activateApp(pkg);
    } catch (e) {
      Logger.Info(`[DEBUG] Failed to activate app, trying am start...`);
      const appActivity = process.env.APP_ACTIVITY || '.MainActivity';
      await driver.execute('mobile: shell', {
        command: 'am start',
        args: ['-n', `${pkg}/${appActivity}`]
      });
    }
  }

  protected BuildTextSelectors(text: string): string[] {
    const escaped = text.replace(/"/g, '\\"');
    const lower = text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    return [
      `//android.widget.TextView[@text="${escaped}"]`,
      `//*[@text="${escaped}"]`,
      `//*[@content-desc="${escaped}"]`,
      `//*[contains(@text, "${escaped}")]`,
      `//*[contains(@content-desc, "${escaped}")]`,
      `android=new UiSelector().textMatches("(?i).*${lower}.*")`,
      `android=new UiSelector().descriptionMatches("(?i).*${lower}.*")`,
    ];
  }

  protected async FindFirstDisplayed(selectors: string[], timeout: number): Promise<WebdriverIO.Element | null> {
    const deadline = Date.now() + timeout;
    while (Date.now() < deadline) {
      for (const selector of selectors) {
        try {
          const element = await this.browserInstance.$(selector);
          if (await element.isExisting() && await element.isDisplayed()) {
            return element;
          }
        } catch (e) {
        }
      }
      await this.browserInstance.pause(500);
    }
    return null;
  }

  async VerifyTxt(text: string) {
    const predefinedLocator = (CommonLocators as any)[text];
    if (predefinedLocator) {
      const selectors = typeof predefinedLocator === 'string' ? [predefinedLocator] : predefinedLocator;
      const element = await this.FindFirstDisplayed(selectors, CommonFunctionPage.DEFAULT_WAIT);
      if (!element) {
        throw new Error(`Element "${text}" not displayed on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
      }
      await expect(element).toBeDisplayed();
      return;
    }
    const element = await this.FindFirstDisplayed(
      this.BuildTextSelectors(text),
      CommonFunctionPage.DEFAULT_WAIT
    );
    if (!element) {
      throw new Error(`Text "${text}" not displayed on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
    }
    await expect(element).toBeDisplayed();
  }

  async WaitUntilTxtDisplayed(text: string) {
    Logger.Info(`[Explicit Wait] Waiting until text "${text}" is displayed...`);
    const predefinedLocator = (CommonLocators as any)[text];

    if (predefinedLocator) {
      const selectors = typeof predefinedLocator === 'string' ? [predefinedLocator] : predefinedLocator;
      const element = await this.FindFirstDisplayed(selectors, CommonFunctionPage.DEFAULT_WAIT);
      if (!element) {
        throw new Error(`Explicit wait failed: Element "${text}" not displayed on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
      }
      await expect(element).toBeDisplayed();
      return;
    }
    const element = await this.FindFirstDisplayed(
      this.BuildTextSelectors(text),
      CommonFunctionPage.DEFAULT_WAIT
    );
    if (!element) {
      throw new Error(`Explicit wait failed: Text "${text}" not displayed on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
    }
    await expect(element).toBeDisplayed();
  }

  async ClickBtn(btn_name: string) {
    const predefinedLocator = (CommonLocators as any)[btn_name];
    if (predefinedLocator) {
      if (typeof predefinedLocator === 'string') {
        const element = await this.browserInstance.$(predefinedLocator);
        if (btn_name === "View All") {
          await element.waitForExist({ timeout: CommonFunctionPage.DEFAULT_WAIT });
          await expect(element).toExist();
        } else {
          await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
          await expect(element).toBeDisplayed();
        }
        if (btn_name === 'Edit order' || btn_name === 'Cancel order' || btn_name === 'Confirm Edit' || btn_name === 'Confirm Order') {
          const freshElement = await this.browserInstance.$(predefinedLocator);
          await freshElement.click();
          return;
        }
        await element.click();
        return;
      } else if (Array.isArray(predefinedLocator)) {
        const element = await this.FindFirstDisplayed(predefinedLocator, CommonFunctionPage.DEFAULT_WAIT);
        if (element) {
          await expect(element).toBeDisplayed();
          if (btn_name === 'Edit order' || btn_name === 'Cancel order' || btn_name === 'Confirm Edit' || btn_name === 'Confirm Order') {
            const freshElement = await this.FindFirstDisplayed(predefinedLocator, 5000);
            if (freshElement) {
              await freshElement.click();
              return;
            }
          }
          await element.click();
          return;
        }
      }
    }

    if (btn_name.startsWith('android:id/')) {
      const locator = CommonLocators.SystemButton(btn_name);
      const element = await this.browserInstance.$(locator);
      await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
      await expect(element).toBeDisplayed();
      await element.click();
      return;
    }



    const element = await this.FindFirstDisplayed(
      this.BuildTextSelectors(btn_name),
      CommonFunctionPage.DEFAULT_WAIT
    );
    if (!element) {
      throw new Error(`Button "${btn_name}" not found on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
    }
    await expect(element).toBeDisplayed();
    await element.click();
  }

  async ClickUntilDisappears(btn_name: string) {
    const btnSelectors = this.BuildTextSelectors(btn_name);

    let btnElement = await this.FindFirstDisplayed(btnSelectors, CommonFunctionPage.DEFAULT_WAIT);
    if (!btnElement) {
      const predefinedLocator = (CommonLocators as any)[btn_name];
      if (predefinedLocator) {
        btnElement = await this.browserInstance.$(typeof predefinedLocator === 'string' ? predefinedLocator : predefinedLocator[0]);
      }
      if (!btnElement) {
        throw new Error(`Button "${btn_name}" not found on screen.`);
      }
    }

    let isSuccess = false;
    for (let i = 0; i < 15; i++) {
      try {
        await btnElement!.click();
      } catch (e) {
        Logger.Info(`Retry click on ${btn_name} failed: ${e}`);
      }

      try {
        // Dynamically wait for the button to disappear (reverse wait) with zero hardcoded pause.
        await btnElement!.waitForDisplayed({ timeout: 3000, reverse: true });
        isSuccess = true;
        break; // It disappeared, navigation successful!
      } catch (e) {
        // Did not disappear, loop and click again.
      }
    }

    if (!isSuccess) {
      throw new Error(`Failed to navigate after clicking "${btn_name}" multiple times. Button is still visible.`);
    }
  }

  async ClickProfileIcon() {
    const xpath = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[3]/com.horcrux.svg.SvgView/com.horcrux.svg.g/ya1';

    const driver = (this.browserInstance as any).isMultiremote
      ? (this.browserInstance as any).mobile
      : this.browserInstance;

    const element = await driver.$(xpath);
    await element.waitForExist({ timeout: CommonFunctionPage.DEFAULT_WAIT });
    await expect(element).toExist();
    await element.click();
  }



  async Scroll(direction: string, targetText: string) {
    const { width, height } = await this.browserInstance.getWindowRect();

    const startX = Math.floor(width / 2);

    let startY: number, endY: number;
    if (direction.toLowerCase() === 'down') {
      startY = Math.floor(height * 0.80);
      endY = Math.floor(height * 0.30);
    } else {
      startY = Math.floor(height * 0.30);
      endY = Math.floor(height * 0.80);
    }

    let isVisible = false;
    let targetElement: WebdriverIO.Element | null = null;
    const selectors = this.BuildTextSelectors(targetText);

    for (let i = 0; i < 15; i++) {
      targetElement = await this.FindFirstDisplayed(selectors, 2000);
      if (targetElement) {
        isVisible = true;
        break;
      }

      try {
        await this.browserInstance.performActions([
          {
            type: 'pointer',
            id: 'finger1',
            parameters: { pointerType: 'touch' },
            actions: [
              { type: 'pointerMove', duration: 0, x: startX, y: startY },
              { type: 'pointerDown', button: 0 },
              { type: 'pause', duration: 300 },
              { type: 'pointerMove', duration: 800, x: startX, y: endY },
              { type: 'pointerUp', button: 0 }
            ]
          }
        ]);
        await this.browserInstance.releaseActions();
      } catch (error) {
        Logger.Info(`Scroll ${direction} failed: ${error}`);
      }
    }

    if (!isVisible || !targetElement) {
      throw new Error(`Text "${targetText}" not found after scrolling ${direction}.`);
    }

    await expect(targetElement).toBeDisplayed();
  }

  async Swipe(direction: string, targetText: string) {
    const { width, height } = await this.browserInstance.getWindowRect();

    const startY = Math.floor(height * 0.75);

    let startX: number, endX: number;
    if (direction.toLowerCase() === 'left') {
      startX = Math.floor(width * 0.80);
      endX = Math.floor(width * 0.20);
    } else {
      startX = Math.floor(width * 0.20);
      endX = Math.floor(width * 0.80);
    }

    let isVisible = false;
    let targetElement: WebdriverIO.Element | null = null;
    const selectors = this.BuildTextSelectors(targetText);

    for (let i = 0; i < 15; i++) {
      targetElement = await this.FindFirstDisplayed(selectors, 2000);
      if (targetElement) {
        isVisible = true;
        break;
      }

      try {
        await this.browserInstance.performActions([
          {
            type: 'pointer',
            id: 'finger1',
            parameters: { pointerType: 'touch' },
            actions: [
              { type: 'pointerMove', duration: 0, x: startX, y: startY },
              { type: 'pointerDown', button: 0 },
              { type: 'pause', duration: 300 },
              { type: 'pointerMove', duration: 800, x: endX, y: startY },
              { type: 'pointerUp', button: 0 }
            ]
          }
        ]);
        await this.browserInstance.releaseActions();
      } catch (error) {
        Logger.Info(`Swipe ${direction} failed: ${error}`);
      }
    }

    if (!isVisible || !targetElement) {
      throw new Error(`Text "${targetText}" not found after swiping ${direction}.`);
    }

    await expect(targetElement).toBeDisplayed();
  }
  async SwipeOnElement(direction: string, elementKey: string, targetText: string) {
    const locator = (CommonLocators as any)[elementKey];
    if (!locator) {
      throw new Error(`Locator "${elementKey}" not found in CommonLocators`);
    }
    const selector = typeof locator === 'string' ? locator : locator[0];
    const element = await this.browserInstance.$(selector);
    await element.waitForExist({ timeout: CommonFunctionPage.DEFAULT_WAIT });

    const location = await element.getLocation();
    const size = await element.getSize();
    const windowSize = await this.browserInstance.getWindowSize();

    let startX: number, endX: number;
    if (direction.toLowerCase() === 'left') {
      startX = Math.floor(location.x + size.width * 0.80);
      endX = Math.floor(location.x + size.width * 0.20);
    } else {
      startX = Math.floor(location.x + size.width * 0.20);
      endX = Math.floor(location.x + size.width * 0.80);
    }
    let centerY = Math.floor(location.y + size.height / 2);

    startX = Math.min(startX, windowSize.width - 5);
    endX = Math.max(endX, 5);
    centerY = Math.min(centerY, windowSize.height - 5);
    centerY = Math.max(centerY, 5);

    let isVisible = false;
    let targetElement: WebdriverIO.Element | null = null;
    const selectors = this.BuildTextSelectors(targetText);

    for (let i = 0; i < 15; i++) {
      targetElement = await this.FindFirstDisplayed(selectors, 2000);
      if (targetElement) {
        isVisible = true;
        break;
      }

      try {
        await this.browserInstance.performActions([
          {
            type: 'pointer',
            id: 'finger1',
            parameters: { pointerType: 'touch' },
            actions: [
              { type: 'pointerMove', duration: 0, x: startX, y: centerY },
              { type: 'pointerDown', button: 0 },
              { type: 'pause', duration: 300 },
              { type: 'pointerMove', duration: 1000, x: endX, y: centerY },
              { type: 'pointerUp', button: 0 }
            ]
          }
        ]);
        await this.browserInstance.releaseActions();
      } catch (error) {
        Logger.Info(`Swipe ${direction} on element failed: ${error}`);
      }
    }

    if (!isVisible || !targetElement) {
      throw new Error(`Text "${targetText}" not found after swiping ${direction}.`);
    }

    await expect(targetElement).toBeDisplayed();
  }

  async WriteInInputField(text: string) {
    await this.browserInstance.keys(text);
  }

  async EnterTextInInputField(textToEnter: string, inputName: string) {
    const predefinedLocator = (CommonLocators as any)[inputName];
    if (inputName === 'OTP' && predefinedLocator) {
      const element = await this.browserInstance.$(predefinedLocator);
      await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
      await expect(element).toBeDisplayed();
      await element.click(); // Focus the field
      for (const char of textToEnter) {
        await this.browserInstance.keys([char]);
      }
      return;
    }
    if (predefinedLocator) {
      if (typeof predefinedLocator === 'string') {
        const element = await this.browserInstance.$(predefinedLocator);
        await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
        await expect(element).toBeDisplayed();
        await element.setValue(textToEnter);
        return;
      } else if (Array.isArray(predefinedLocator)) {
        const element = await this.FindFirstDisplayed(predefinedLocator, CommonFunctionPage.DEFAULT_WAIT);
        if (element) {
          await expect(element).toBeDisplayed();
          await element.setValue(textToEnter);
          return;
        }
      }
    }

    const dynamicLocator = CommonLocators.DynamicTextInput(inputName);
    const element = await this.browserInstance.$(dynamicLocator);
    try {
      await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
      await expect(element).toBeDisplayed();
    } catch (error) {
      throw new Error(`Input field "${inputName}" not found on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
    }
    await element.setValue(textToEnter);
  }

  async EnterCapturedOrderIdInInputField(inputName: string) {
    const capturedOrderId = DataStore.get('orderId');
    if (!capturedOrderId) {
      throw new Error("Order ID was not captured previously!");
    }
    await this.EnterTextInInputField(capturedOrderId, inputName);
  }

  async HitKey(keyName: string) {
    if (keyName.toLowerCase() === 'enter') {
      await this.browserInstance.keys(['Enter']);
    } else {
      await this.browserInstance.keys([keyName]);
    }
  }


  async OpenLinkInMobileBrowser(url: string) {
    Logger.Info(`[openLinkInMobileBrowser] Opening link in mobile browser: ${url}`);

    let driver: any = (browser as any).isMultiremote ? (browser as any).mobile : this.browserInstance;

    Logger.Info(`[openLinkInMobileBrowser] Using mobile driver to open link`);

    try {
      await driver.execute('mobile: deepLink', { url: url });
      Logger.Info(`[openLinkInMobileBrowser] Successfully opened in mobile browser via deepLink: ${url}`);
    } catch (error) {
      Logger.Info(`[openLinkInMobileBrowser] deepLink failed, attempting am start fallback...`);
      await driver.execute('mobile: shell', {
        command: 'am start',
        args: ['-a', 'android.intent.action.VIEW', '-d', url]
      });
      Logger.Info(`[openLinkInMobileBrowser] Successfully opened in mobile browser via am start: ${url}`);
    }
  }

  async ClickWebLink(link: string) {
    let driver: any = this.browserInstance;
    if ((this.browserInstance as any).isMultiremote) {
      // In multiremote tests, target the specific web session capability
      driver = (this.browserInstance as any).chrome || (this.browserInstance as any).web || (this.browserInstance as any).browser || this.browserInstance;
    }

    const lowerHref = link.toLowerCase();
    const xpathTextLower = `translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')`;
    let locator = `//a[@href="${link}"]`;

    if (lowerHref === 'assign order to me' || lowerHref === 'assign manually') {
      locator = `//*[contains(@class, 'link-button') and contains(${xpathTextLower}, '${lowerHref}')] | //button[contains(${xpathTextLower}, '${lowerHref}')] | //a[contains(${xpathTextLower}, '${lowerHref}')]`;
    } else if (lowerHref === 'assign order' || lowerHref === 'create refund') {
      locator = `//input[@name='commit'] | //button[contains(${xpathTextLower}, '${lowerHref}')]`;
    } else if (lowerHref === 'ktm test branch' || lowerHref === 'restaurant dashboard' || lowerHref === 'refund order') {
      locator = `//a[${xpathTextLower}='${lowerHref}'] | //*[${xpathTextLower}='${lowerHref}']`;
    } else if (lowerHref === 'print receipt & start collecting' || lowerHref === 'ok' || lowerHref === 'prepared' || lowerHref === 'fail') {
      locator = `//button[${xpathTextLower}='${lowerHref}'] | //div[contains(@class, 'button') and contains(${xpathTextLower}, '${lowerHref}')]`;
    } else if (lowerHref === 'partial') {
      locator = `//label[${xpathTextLower}='${lowerHref}']`;
    } else {
      locator = `//*[${xpathTextLower}='${lowerHref}'] | //input[translate(normalize-space(@value), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='${lowerHref}']`;
    }

    try {
      const element = await driver.$(locator);
      await element.waitForDisplayed({ timeout: 10000 });
      await element.click();
      Logger.Info(`[click_web_link] Successfully clicked link element: ${link}`);
    } catch (error) {
      Logger.Info(`[click_web_link] Element not found, attempting direct URL navigation fallback to: ${link}`);
      await driver.url(link);
    }
  }

  async OpenWebLinkDirectly(link: string) {
    let driver: any = this.browserInstance;
    if ((this.browserInstance as any).isMultiremote) {
      driver = (this.browserInstance as any).chrome || (this.browserInstance as any).web || (this.browserInstance as any).browser || this.browserInstance;
    }
    Logger.Info(`[open_web_link_directly] Navigating directly to URL: ${link}`);
    await driver.url(link);
  }


  async TurnOnMobileLocation() {
    Logger.Info("[DEBUG] Opening notification shade to turn on location...");
    const driver = (this.browserInstance as any).isMultiremote
      ? (this.browserInstance as any).mobile
      : this.browserInstance;

    try {
      await driver.openNotifications();

      const locationSelectors = [
        '//android.widget.Switch[contains(@content-desc, "Location")]',
        '//android.widget.ImageView[contains(@content-desc, "Location")]',
        '//android.widget.TextView[@text="Location"]',
        'android=new UiSelector().descriptionContains("Location")'
      ];

      let elementFound = null;
      for (const selector of locationSelectors) {
        try {
          const el = await driver.$(selector);
          if (await el.isExisting() && await el.isDisplayed()) {
            elementFound = el;
            break;
          }
        } catch (e) {
          Logger.Warn(`[Toggle Location] Failed to click 'Done' on keyboard: ${e}`);
        }
      }

      if (elementFound) {
        const contentDesc = (await elementFound.getAttribute('content-desc')) || '';
        if (contentDesc.toLowerCase().includes('off')) {
          await elementFound.click();
          Logger.Info("[DEBUG] Toggled Location to ON from notification shade.");
        } else if (contentDesc.toLowerCase().includes('on')) {
          Logger.Info("[DEBUG] Location is already ON.");
        } else {
          Logger.Info("[DEBUG] Found location tile but couldn't determine state. Clicking it just in case.");
          await elementFound.click();
        }
      } else {
        Logger.Info("[DEBUG] Could not find Location toggle in notification shade.");
      }
    } catch (e) {
      Logger.Info(`[DEBUG] Error during location toggle: ${e}`);
    } finally {
      try {
        await driver.back();
      } catch (e) {
        try {
          await driver.execute('mobile: shell', { command: 'input', args: ['keyevent', '4'] });
        } catch (err) {
          Logger.Warn(`[Toggle Location] Failed to send back keyevent via shell: ${err}`);
        }
      }
    }
  }
}
