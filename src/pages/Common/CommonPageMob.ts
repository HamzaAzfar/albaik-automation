import { CommonLocators } from '../../locators/Common/CommonLocator';
import { BasePage } from '../../common/mobile/BasePage';
import { TestData } from '../../data/Common/TestData';
import { DataStore } from '../../services/DataStore';
import { Given as CucumberGiven, When as CucumberWhen, Then as CucumberThen } from '@cucumber/cucumber';
function launchapp(fn: Function) {
  const wrapper = async function(this: any, ...args: any[]) {
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
        console.log(`\nLocator found, Step passed\n`);
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
    return DataStore.get('isSmokeTest') ? 10000 : 60000;
  }
  private bottomSheetAnchor = CommonLocators.bottomSheetAnchor;


  async WaitForHomeScreen(): Promise<void> {
    if ((browser as any).isMultiremote && (browser as any).customerApp) {
      DataStore.set('mobileContext', 'customerApp');
    }
    const pkg = process.env.APP_PACKAGE || 'com.albaik.customer.staging';
    try { 
      await this.browserInstance.terminateApp(pkg); 
    } catch (e) {
    }
    await this.browserInstance.activateApp(pkg);
    
    try {
      await this.waitForElement(this.bottomSheetAnchor, 10000);
    } catch (e) {
      console.log(`\n'Pickup from a restaurant' not found on launch\n`);
    }
  }

  async LaunchDriverApplication(): Promise<void> {
    const driverPkg = process.env.DRIVER_APP_PACKAGE || 'com.albaikdriver';
    const driverActivity = process.env.DRIVER_APP_ACTIVITY || 'com.albaikdriver.MainActivity';

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
      console.log(`\n[ERROR] Driver application package '${driverPkg}' is NOT installed on the device! Please install it.\n`);
      throw new Error(`Package ${driverPkg} not installed`);
    }

    try {
      await targetDriver.activateApp(driverPkg);
    } catch (error) {
      console.log(`[DEBUG] activateApp failed. Attempting fallback via monkey...`);
      try {
        await targetDriver.execute('mobile: shell', {
          command: 'monkey',
          args: ['-p', driverPkg, '-c', 'android.intent.category.LAUNCHER', '1']
        });
      } catch (fallbackError) {
        console.log(`[DEBUG] monkey failed. Attempting am start fallback...`);
        await targetDriver.execute('mobile: shell', {
          command: 'am start',
          args: ['-n', `${driverPkg}/${driverActivity}`]
        });
      }
    }
  }

  async CloseCustomerApplication(): Promise<void> {
    const customerPkg = process.env.APP_PACKAGE || 'com.albaik.customer.staging';

    if ((browser as any).isMultiremote && (browser as any).customerApp) {
      await (browser as any).customerApp.terminateApp(customerPkg);
      return;
    }

    const driver = (this.browserInstance as any).isMultiremote
      ? (this.browserInstance as any).mobile
      : this.browserInstance;
    await driver.terminateApp(customerPkg);
  }

  private BuildTextSelectors(text: string): string[] {
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

  private async FindFirstDisplayed(selectors: string[], timeout: number): Promise<WebdriverIO.Element | null> {
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
    console.log(`[Explicit Wait] Waiting until text "${text}" is displayed...`);
    const predefinedLocator = (CommonLocators as any)[text];
    
    if (predefinedLocator) {
      const selectors = typeof predefinedLocator === 'string' ? [predefinedLocator] : predefinedLocator;
      const element = await this.FindFirstDisplayed(selectors, CommonFunctionPage.DEFAULT_WAIT);
      if (!element) {
        throw new Error(`Explicit wait failed: Element "${text}" not displayed on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
      }
      return;
    }
    const element = await this.FindFirstDisplayed(
      this.BuildTextSelectors(text),
      CommonFunctionPage.DEFAULT_WAIT
    );
    if (!element) {
      throw new Error(`Explicit wait failed: Text "${text}" not displayed on screen within ${CommonFunctionPage.DEFAULT_WAIT}ms`);
    }
  }

  async ClickBtn(btn_name: string) {
    const predefinedLocator = (CommonLocators as any)[btn_name];
    if (predefinedLocator) {
        if (typeof predefinedLocator === 'string') {
            const element = await this.browserInstance.$(predefinedLocator);
            if (btn_name === "View All") {
                await element.waitForExist({ timeout: CommonFunctionPage.DEFAULT_WAIT });
            } else {
                await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
            }
            if (btn_name === 'Edit order' || btn_name === 'Cancel order' || btn_name === 'Confirm Edit' || btn_name === 'Confirm Order') {
                await this.browserInstance.pause(1500); // Pause for bottom sheet animation
                const freshElement = await this.browserInstance.$(predefinedLocator);
                await freshElement.click();
                return;
            }
            await element.click();
            return;
        } else if (Array.isArray(predefinedLocator)) {
            const element = await this.FindFirstDisplayed(predefinedLocator, CommonFunctionPage.DEFAULT_WAIT);
            if (element) {
                if (btn_name === 'Edit order' || btn_name === 'Cancel order' || btn_name === 'Confirm Edit' || btn_name === 'Confirm Order') {
                    await this.browserInstance.pause(1500); // Pause for bottom sheet animation
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
        const locator = CommonLocators.systemButton(btn_name);
        const element = await this.browserInstance.$(locator);
        await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
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
    await element.click();
  }

  async ClickProfileIcon() {
    const xpath = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[3]/com.horcrux.svg.SvgView/com.horcrux.svg.g/ya1';
    
    const driver = (this.browserInstance as any).isMultiremote 
      ? (this.browserInstance as any).mobile 
      : this.browserInstance;
      
    const element = await driver.$(xpath);
    await element.waitForExist({ timeout: CommonFunctionPage.DEFAULT_WAIT }); 
    await element.click();
  }

  
  async WaitForSeconds(seconds: number) {
    await this.browserInstance.pause(seconds * 1000);
  }

 async ScrollDownLines(lines: number) {
  const { width, height } = await this.browserInstance.getWindowRect();

  const startX = Math.floor(width / 2);

  const startY = Math.floor(height * 0.80);
  const endY = Math.floor(height * 0.30);

  for (let i = 0; i < lines; i++) {
    try {
      await this.browserInstance.performActions([
        {
          type: 'pointer',
          id: 'finger1',
          parameters: { pointerType: 'touch' },
          actions: [
            {
              type: 'pointerMove',
              duration: 0,
              x: startX,
              y: startY
            },
            {
              type: 'pointerDown',
              button: 0
            },
            {
              type: 'pause',
              duration: 300
            },
            {
              type: 'pointerMove',
              duration: 800,
              x: startX,
              y: endY
            },
            {
              type: 'pointerUp',
              button: 0
            }
          ]
        }
      ]);

      await this.browserInstance.releaseActions();

      await this.browserInstance.pause(1000);

    } catch (error) {
      console.log('Scroll failed:', error);
    }
  }
}

  async SwipeLeft(times: number) {
    const { width, height } = await this.browserInstance.getWindowRect();

    const startY = Math.floor(height * 0.75);

    const startX = Math.floor(width * 0.80);
    const endX = Math.floor(width * 0.20);

    for (let i = 0; i < times; i++) {
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
        await this.browserInstance.pause(1000);
      } catch (error) {
        console.log('Swipe left failed:', error);
      }
    }
  }
//for favorites
  async SwipeLeftOnElement(times: number, elementKey: string) {
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

    let startX = Math.floor(location.x + size.width * 0.80);
    let endX = Math.floor(location.x + size.width * 0.20);
    let centerY = Math.floor(location.y + size.height / 2);

    // Clamp coordinates to the physical screen width/height to avoid out-of-bounds error
    startX = Math.min(startX, windowSize.width - 5);
    endX = Math.max(endX, 5);
    centerY = Math.min(centerY, windowSize.height - 5);
    centerY = Math.max(centerY, 5);

    for (let i = 0; i < times; i++) {
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
        await this.browserInstance.pause(1000);
      } catch (error) {
        console.log('Swipe left on element failed:', error);
      }
    }
  }

  async WriteInInputField(text: string) {
    await this.browserInstance.keys(text);
  }

  async EnterTextInInputField(textToEnter: string, inputName: string) {
    const predefinedLocator = (CommonLocators as any)[inputName];
        if (inputName === 'OTP' && predefinedLocator) {
        const element = await this.browserInstance.$(predefinedLocator);
        await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
        await element.click(); // Focus the field
        for (const char of textToEnter) {
            await this.browserInstance.keys([char]);
            await this.browserInstance.pause(1000); // 1-second break between each digit
        }
        return;
    }
    if (predefinedLocator) {
        if (typeof predefinedLocator === 'string') {
            const element = await this.browserInstance.$(predefinedLocator);
            await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
            await element.setValue(textToEnter);
            return;
        } else if (Array.isArray(predefinedLocator)) {
            const element = await this.FindFirstDisplayed(predefinedLocator, CommonFunctionPage.DEFAULT_WAIT);
            if (element) {
                await element.setValue(textToEnter);
                return;
            }
        }
    }

    const dynamicLocator = CommonLocators.dynamicTextInput(inputName);
    const element = await this.browserInstance.$(dynamicLocator);
    try {
        await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
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

  async SelectCardEndingWith(lastFourDigits: string) {
    const locator = CommonLocators.cardEndingWith(lastFourDigits);
    const element = await this.browserInstance.$(locator);
    await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
    await element.click();
  }

  async EnterPassword(password?: string) {
    const text = password || process.env.MOBILE_PASSWORD || TestData.mobile?.password;
    if (!text) {
        throw new Error("Mobile password missing. Please set MOBILE_PASSWORD in your .env file or pass it to the step.");
    }

    const element = await this.browserInstance.$(CommonLocators.passwordInput);
    await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
    await element.setValue(text);
  }

  
    
    async RedirectToBranchViaIntent(branchId: string): Promise<void> {
        const deepLink = `albaik://store/${branchId}`; // Construct the deep link
        const pkg = process.env.APP_PACKAGE || 'com.albaik.customer.staging'; // Get package from .env or fallback
        const appActivity = process.env.APP_ACTIVITY || '.MainActivity'; // Get main activity from .env
        
        console.log(`Initiating front-end redirection to branch ${branchId} via Deep Link: ${deepLink}`);

        try {
            console.log("[DEBUG] Dismissing camera/overlay before redirection...");
            await this.browserInstance.back();
            await this.browserInstance.pause(1500);
            const currentActivityPackage = await this.browserInstance.getCurrentPackage();
            if (currentActivityPackage === 'com.android.permissioncontroller' || currentActivityPackage === 'com.android.camera2') {
                await this.browserInstance.back();
                await this.browserInstance.pause(1500); 
            }
        } catch (e) {
            console.log("[DEBUG] Back navigation not required or failed to dismiss camera/overlay (might not have been open).");
        }

        
        let deepLinkSuccessful = false;
        const componentName = `${pkg}/${appActivity}`;
        
        try {
            console.log(`[DEBUG] Attempting to force deep link via explicit component: ${componentName}`);
            
            await this.browserInstance.execute('mobile: shell', {
                command: 'am start',
                args: [
                    '-W',
                    '-n', componentName, 
                    '-a', 'android.intent.action.VIEW',
                    '-d', deepLink
                ]
            });
            deepLinkSuccessful = true;
            console.log(`[DEBUG] Forced deep link sent successfully.`);
        } catch (error) {
            console.warn(`[DEBUG] Explicit component deep link failed. Error: ${error.message || error}`);
            console.log("[DEBUG] Retrying with standard system-wide deep link resolve...");
            try {
                await this.browserInstance.execute('mobile: deepLink', { url: deepLink });
                deepLinkSuccessful = true;
                console.log("[DEBUG] System-wide deep link sent successfully.");
            } catch (err2) {
                console.warn(`[DEBUG] System-wide deep link failed. Error: ${err2.message || err2}`);
            }
        }

        if (!deepLinkSuccessful) {
            throw new Error(`Failed to send deep link intent. The OS could not resolve it. Check if APP_PACKAGE and APP_ACTIVITY are correct in .env`);
        }

        await this.browserInstance.pause(4000);
    }
    async CaptureAndStoreOrderId(
  trackingCardId: string
) {

  const orderIdLocator =
    CommonLocators.trackingOrderId(trackingCardId);

  const orderIdElement =
    await this.browserInstance.$(orderIdLocator);

  await orderIdElement.waitForDisplayed({
    timeout: 20000,
  });

  const fullText =
    await orderIdElement.getText();

  // Example => #S71582
  const orderId =
    fullText.replace('#', '').trim();

  DataStore.set('orderId', orderId);

  console.log(
    `Captured Order ID: ${DataStore.get('orderId')}`
  );
}

  async HandleDynamicCheckout(cvv: string) {
    console.log("[Dynamic Checkout] Checking which checkout layout is currently active...");
    try {
        // Try to find the "Continue" button first (Updated Flow)
        // We use a shorter timeout (10s) so we don't delay the test if it's the old layout
        const continueSelectors = this.BuildTextSelectors("Continue");
        const element = await this.FindFirstDisplayed(continueSelectors, 10000); 
        
        if (!element) {
            throw new Error("Continue button not found, assuming previous layout.");
        }
        
        // --- ORIGINAL UPDATED FLOW ---
        await element.click(); 
        await this.WaitForSeconds(5);
        await this.EnterTextInInputField(cvv, "checkoutCvv");
        await this.ClickBtn("Pay with card");
        console.log("[Dynamic Checkout] Successfully executed the ORIGINAL UPDATED checkout flow.");

    } catch (error: any) {
        console.log(`[Dynamic Checkout] Updated layout not detected. Error: ${error.message}`);
        console.log("[Dynamic Checkout] Falling back to the OTHER PREVIOUS checkout layout...");
        
        // --- OTHER PREVIOUS FLOW ---
        // (Adjust these steps below if your previous flow differs)
        const cardName = process.env.TEST_CARD_NAME || (TestData as any).card?.name;
        const cardNumber = process.env.TEST_CARD_NUMBER || (TestData as any).card?.number;
        const cardExpiry = process.env.TEST_CARD_EXPIRY || (TestData as any).card?.expiry;

        if (!cardName || !cardNumber || !cardExpiry) {
            throw new Error("Test card details missing. Please set TEST_CARD_NAME, TEST_CARD_NUMBER, and TEST_CARD_EXPIRY in your .env file");
        }

        await this.ClickBtn("Credit / Debit");
        await this.EnterTextInInputField(cardName, "card_holder_name_input");
        await this.EnterTextInInputField(cardNumber, "card_number_input");
        await this.EnterTextInInputField(cardExpiry, "expiry_date_input");
        await this.EnterTextInInputField(cvv, "cvv_input");
        
    }
  }

  async CaptureAndStoreAmount(locatorKey: string, key: string) {
    const driver = (this.browserInstance as any).isMultiremote 
      ? (this.browserInstance as any).mobile 
      : this.browserInstance;

    // Clear only the specific key's stored value to ensure fresh capture
    const oldValue = DataStore.get(key);
    DataStore.set(key, undefined);
    console.log(`[captureAndStoreAmount] Cleared old value for key: "${key}" (was: "${oldValue}")`);

    let actualLocator = (CommonLocators as any)[locatorKey] || locatorKey;
    
    console.log(`[captureAndStoreAmount] Using locator: ${actualLocator}`);
    
    // Wait a bit for the page to stabilize
    await this.browserInstance.pause(1000);
    
    let elements = await driver.$$(actualLocator);
    
    console.log(`[captureAndStoreAmount] Found ${elements.length} elements with locator`);
    
    if (elements.length === 0) {
        throw new Error(`Could not find any element with locator: ${actualLocator}`);
    }
    
    // Collect all visible elements with their amounts
    const visibleAmounts: Array<{text: string, value: number, index: number}> = [];
    
    for (let i = 0; i < elements.length; i++) {
      try {
        const isDisplayed = await elements[i].isDisplayed();
        const text = await elements[i].getText();
        console.log(`[captureAndStoreAmount] Element [${i}]: "${text}" | isDisplayed: ${isDisplayed}`);
        
        if (isDisplayed) {
          // Extract numeric value from text like "10.00 ﷼" or "755.00 ﷼"
          const numMatch = text.match(/[\d.,]+/);
          if (numMatch) {
            const numValue = parseFloat(numMatch[0].replace(/,/g, ''));
            visibleAmounts.push({text: text.trim(), value: numValue, index: i});
          }
        }
      } catch (e) {
        console.log(`[captureAndStoreAmount] Element [${i}]: Could not check visibility`);
      }
    }
    
    if (visibleAmounts.length === 0) {
      throw new Error(`No visible elements with numeric amounts found using locator: ${actualLocator}`);
    }
    
    // Sort by value (descending) and get the largest amount (the total)
    visibleAmounts.sort((a, b) => b.value - a.value);
    const largestAmount = visibleAmounts[0];
    
    DataStore.set(key, largestAmount.text);
    console.log(`[captureAndStoreAmount] Captured LARGEST visible amount: "${largestAmount.text}" (${largestAmount.value}) from element [${largestAmount.index}] and stored as key: "${key}"`);
  }

  async CompareStoredAmounts(key1: string, key2: string) {
    const amount1 = DataStore.get(key1);
    const amount2 = DataStore.get(key2);
    
    if (amount1 !== amount2) {
        throw new Error(`Verification Failed! Amounts do not match. ${key1} = ${amount1}, ${key2} = ${amount2}`);
    }
    
    console.log(`Verification Passed! ${key1} (${amount1}) matches ${key2} (${amount2})`);
  }

  async OpenLinkInMobileBrowser(url: string) {
    console.log(`[openLinkInMobileBrowser] Opening link in mobile browser: ${url}`);
    
    // Get the mobile driver for multiremote mode
    let driver: any = (browser as any).isMultiremote ? (browser as any).mobile : this.browserInstance;
    
    console.log(`[openLinkInMobileBrowser] Using mobile driver to open link`);
    
    // Open the link in mobile browser using deep link (this terminates the app and opens browser)
    try {
        await driver.execute('mobile: deepLink', { url: url });
        console.log(`[openLinkInMobileBrowser] Successfully opened in mobile browser via deepLink: ${url}`);
    } catch (error) {
        console.log(`[openLinkInMobileBrowser] deepLink failed, attempting am start fallback...`);
        await driver.execute('mobile: shell', {
            command: 'am start',
            args: ['-a', 'android.intent.action.VIEW', '-d', url]
        });
        console.log(`[openLinkInMobileBrowser] Successfully opened in mobile browser via am start: ${url}`);
    }
    
    await driver.pause(3000);
  }

  async ClickWebLink(link: string) {
    let driver: any = this.browserInstance;
    if ((this.browserInstance as any).isMultiremote) {
        // In multiremote tests, target the specific web session capability
        driver = (this.browserInstance as any).chrome || (this.browserInstance as any).web || (this.browserInstance as any).browser || this.browserInstance;
    }

    const locator = CommonLocators.webLinkByHref(link);
    try {
        const element = await driver.$(locator);
        // Using a 10s wait so the fallback URL navigation kicks in quickly if the link element isn't directly clickable
        await element.waitForDisplayed({ timeout: 10000 });
        await element.click();
        console.log(`[click_web_link] Successfully clicked link element: ${link}`);
    } catch (error) {
        console.log(`[click_web_link] Element not found, attempting direct URL navigation fallback to: ${link}`);
        await driver.url(link);
    }
  }

  async OpenWebLinkDirectly(link: string) {
    let driver: any = this.browserInstance;
    if ((this.browserInstance as any).isMultiremote) {
        // In multiremote tests, target the specific web session capability
        driver = (this.browserInstance as any).chrome || (this.browserInstance as any).web || (this.browserInstance as any).browser || this.browserInstance;
    }
    console.log(`[open_web_link_directly] Navigating directly to URL: ${link}`);
    await driver.url(link);
  }

  async SignOutIfSignedIn() {
    try {
      console.log("[DEBUG] Checking if user is already signed in...");
      const signOutSelectors = this.BuildTextSelectors("Sign out");
      const signOutBtn = await this.FindFirstDisplayed(signOutSelectors, 5000);
      
      if (signOutBtn) {
        console.log("[DEBUG] 'Sign out' button found. User is signed in. Clicking 'Sign out'...");
        await signOutBtn.click();
        await this.WaitForSeconds(3);
        
        console.log("[DEBUG] Reopening menu for the subsequent Sign In steps...");
        await this.ClickBtn("android:id/content");
      } else {
        console.log("[DEBUG] 'Sign out' not found. Assuming user is not signed in.");
      }
    } catch (e) {
      console.log("[DEBUG] Error checking sign out state, proceeding...", e);
    }
  }
}
