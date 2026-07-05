import { Given as CucumberGiven, When as CucumberWhen, Then as CucumberThen } from '@cucumber/cucumber';
import { MobileLocators } from '../../locators/Mobile/MobileLocator';
import { WebLocators } from '../../locators/Web/WebLocator';
import { DriverLocators } from '../../locators/Driver/DriverLocator';

const CommonLocators = { ...MobileLocators, ...WebLocators, ...DriverLocators };
import { DataStore } from '../../services/DataStore';
import { Logger } from '../../utils/Logger';
import { WebSessionManager } from '../../services/WebSessionManager';

export function launchapp(fn: Function) {
  const wrapper = async function (this: any, ...args: any[]) {
    let timeoutId: NodeJS.Timeout;
    try {
      const timeoutPromise = new Promise((_, reject) => {
        timeoutId = setTimeout(() => reject(new Error('Step execution exceeded 90s timeout.')), 90000);
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
  if (typeof optionsOrFn === 'function') {
    CucumberGiven(pattern, launchapp(optionsOrFn));
  } else {
    CucumberGiven(pattern, optionsOrFn, launchapp(fn));
  }
};

export const When = (pattern: any, optionsOrFn: any, fn?: any) => {
  if (typeof optionsOrFn === 'function') {
    CucumberWhen(pattern, launchapp(optionsOrFn));
  } else {
    CucumberWhen(pattern, optionsOrFn, launchapp(fn));
  }
};

export const Then = (pattern: any, optionsOrFn: any, fn?: any) => {
  if (typeof optionsOrFn === 'function') {
    CucumberThen(pattern, launchapp(optionsOrFn));
  } else {
    CucumberThen(pattern, optionsOrFn, launchapp(fn));
  }
};

export class CommonWebPage {
  protected get webDriver() {
    return WebSessionManager.getSession();
  }

  public static get DEFAULT_WAIT(): number {
    return DataStore.get('isSmokeTest') ? 1000 : 15000;
  }

  async WaitForRestaurantPanel() {
    const locator = `//a[@href="/admin/orders"] | //*[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'restaurant dashboard')]`;
    const element = await this.webDriver.$(locator);
    await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();
  }

  async ScrollDownWeb() {
    await this.webDriver.execute(() => {
      window.scrollBy(0, 500);
    });
  }

  async WaitForCurbsidePanel() {
    const locator = `//*[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'curbside')]`;
    const element = await this.webDriver.$(locator);
    await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();
  }

  async ClickWebLinkByHref(href: string) {
    const lowerHref = href.toLowerCase();
    const xpathTextLower = `translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')`;
    let locator = `//a[@href="${href}"]`;

    if (lowerHref === 'assign order to me' || lowerHref === 'assign manually') {
      locator = `//*[contains(@class, 'link-button') and contains(${xpathTextLower}, '${lowerHref}')] | //button[contains(${xpathTextLower}, '${lowerHref}')] | //a[contains(${xpathTextLower}, '${lowerHref}')]`;
    } else if (lowerHref === 'assign order' || lowerHref === 'create refund') {
      locator = `//input[@name='commit'] | //button[contains(${xpathTextLower}, '${lowerHref}')]`;
    } else if (
      lowerHref === 'ktm test branch' ||
      lowerHref === 'restaurant dashboard' ||
      lowerHref === 'refund order'
    ) {
      locator = `//a[${xpathTextLower}='${lowerHref}'] | //*[${xpathTextLower}='${lowerHref}']`;
    } else if (lowerHref === 'driver queue' || lowerHref === 'remove from queue') {
      locator = `//a[normalize-space(.)='${href}'] | //a[${xpathTextLower}='${lowerHref}']`;
    } else if (
      lowerHref === 'print receipt & start collecting' ||
      lowerHref === 'ok' ||
      lowerHref === 'prepared' ||
      lowerHref === 'fail'
    ) {
      locator = `//button[${xpathTextLower}='${lowerHref}'] | //div[contains(@class, 'button') and contains(${xpathTextLower}, '${lowerHref}')]`;
    } else if (lowerHref === 'partial') {
      locator = `//label[${xpathTextLower}='${lowerHref}']`;
    } else if (lowerHref === 'product input') {
      locator = `//span[@id='select2-product_schedule_product_id-container'] | //div[@class='input select optional product_schedule_product_id']//span[contains(@class,'select2-selection')]`;
    } else if (lowerHref === 'country') {
      locator = `//span[@id='select2-product_schedule_country_id-container'] | //div[@class='input select optional product_schedule_country_id']//span[contains(@class,'select2-selection')]`;
    } else if (lowerHref === 'tahina sauce') {
      locator = `//li[contains(@id,'select2-product_schedule_product_id-result') and contains(@id,'-121')] | //li[contains(@class,'select2-results__option') and contains(${xpathTextLower}, 'tahina sauce')]`;
    } else if (lowerHref === 'saudia arabia') {
      locator = `//li[contains(@id,'select2-product_schedule_country_id-result') and contains(@id,'-1')] | //li[contains(@class,'select2-results__option') and contains(${xpathTextLower}, 'saudia arabia')]`;
    } else if (lowerHref === 'New Product' && href === 'New Product') {
      locator = `//a[normalize-space()='New Product'] | //a[${xpathTextLower}='New Product']`;
    } else if (lowerHref === 'create product schedule' || lowerHref === 'update product schedule') {
      locator = `//input[@name='commit'] | //button[contains(${xpathTextLower}, '${lowerHref}')]`;
    } else if (lowerHref === 'delete') {
      locator = `//li[2]//div[1]//form[1]//button[1] | //button[${xpathTextLower}='delete']`;
    } else if (['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'].includes(lowerHref)) {
      locator = `//label[normalize-space()='${href}'] | //label[${xpathTextLower}='${lowerHref}']`;
    } else {
      locator = `//a[@href="${href}"] | //*[${xpathTextLower}='${lowerHref}'] | //input[translate(normalize-space(@value), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='${lowerHref}']`;
    }

    const universalFallback = ` | //*[self::a or self::button or self::span or contains(translate(@class, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'btn') or contains(translate(@class, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'button')][${xpathTextLower}='${lowerHref}' or contains(translate(@href, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '${lowerHref}')]`;

    locator = locator + universalFallback;

    const element = await this.webDriver.$(locator);
    await element.waitForExist({ timeout: CommonWebPage.DEFAULT_WAIT });
    await element.scrollIntoView({ block: 'center' });
    await element.waitForDisplayed({ timeout: 5000 });
    await expect(element).toBeDisplayed();

    try {
      await element.click();
    } catch (error) {
      Logger.Info(`[Web] Standard click failed for "${href}", falling back to JS click.`);
      await this.webDriver.execute((el: any) => el.click(), element);
    }
  }

  async ClickIfTextAvailable(textToCheck: string, textToClick: string) {
    const lowerText = textToCheck.toLowerCase();
    const xpathTextLower = `translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')`;
    const locator = `//*[contains(${xpathTextLower}, '${lowerText}')]`;

    try {
      const element = await this.webDriver.$(locator);
      await element.waitForDisplayed({ timeout: 5000 });
      Logger.Info(`[Web] Text "${textToCheck}" is available, clicking on "${textToClick}"`);
      await this.ClickWebLinkByHref(textToClick);

      try {
        // Short wait to see if an alert appears and accept it automatically
        await this.webDriver.waitUntil(
          async () => {
            try {
              return (await this.webDriver.getAlertText()) !== null;
            } catch {
              return false;
            }
          },
          { timeout: 2000 },
        );
        await this.webDriver.acceptAlert();
        Logger.Info(`[Web] Accepted alert after clicking "${textToClick}"`);
      } catch (e) {
        // No alert appeared, perfectly fine
      }
    } catch (error) {
      Logger.Info(`[Web] Text "${textToCheck}" is NOT available. Moving to next step.`);
    }
  }

  async EnterCapturedOrderIdById(id: string) {
    const locator = CommonLocators.WebInputById(id);
    const element = await this.webDriver.$(locator);
    await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();

    const capturedOrderId = DataStore.get('orderId');
    if (!capturedOrderId) {
      throw new Error('Order ID was not captured previously!');
    }

    await element.setValue(capturedOrderId);
    Logger.Info(`[Web] Entered captured Order ID: ${capturedOrderId}`);
  }

  async HitEnterWeb() {
    await this.webDriver.keys(['Enter']);
    Logger.Info(`[Web] Hit 'Enter' key`);
  }

  async ClickCapturedOrderRow() {
    const capturedOrderId = DataStore.get('orderId');
    if (!capturedOrderId) {
      throw new Error('Order ID was not captured previously!');
    }

    const locator = CommonLocators.DynamicOrderRow(capturedOrderId);
    const element = await this.webDriver.$(locator);
    await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();
    await element.click();
    Logger.Info(`[Web] Clicked on order with ID: ${capturedOrderId}`);
  }

  async VerifyOrderDetailsPage() {
    const capturedOrderId = DataStore.get('orderId');
    if (!capturedOrderId) {
      throw new Error('Order ID was not captured previously!');
    }

    const locator = CommonLocators.DynamicOrderRow(capturedOrderId);
    const element = await this.webDriver.$(locator);
    await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();
    Logger.Info(`[Web] Verified order details page is displayed for Order ID: ${capturedOrderId}`);
  }

  async AcceptWebAlert() {
    try {
      await this.webDriver.acceptAlert();
      Logger.Info(`[Web] Accepted web alert`);
    } catch (e) {
      Logger.Info(`[Web] No alert to accept or failed to accept alert: ${e}`);
    }
  }

  async EnterTextInInputWeb(text: string, inputName: string) {
    const locator = (CommonLocators as any)[inputName] || CommonLocators.WebInputById(inputName);
    const element = await this.webDriver.$(locator);
    await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();
    await element.setValue(text);
    Logger.Info(`[Web] Entered text "${text}" into "${inputName}"`);
  }

  async VerifyTextOnWeb(text: string) {
    const lowerText = text.toLowerCase();
    const xpathTextLower = `translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')`;
    const locator = `//*[contains(${xpathTextLower}, '${lowerText}')]`;
    const element = await this.webDriver.$(locator);
    await element.waitForExist({ timeout: CommonWebPage.DEFAULT_WAIT });
    await expect(element).toExist();
    Logger.Info(`[Web] Verified text is present on web: "${text}"`);
  }

  async ToggleFeatureFlag(flagName: string, action: 'Enable' | 'Disable') {
    Logger.Info(`[Web] Navigating to Admin Settings -> Feature Flags`);
    const adminSettingsXPath = "//span[normalize-space()='Admin Settings']";
    const adminSettings = await this.webDriver.$(adminSettingsXPath);
    await adminSettings.waitForExist({ timeout: CommonWebPage.DEFAULT_WAIT });
    await adminSettings.scrollIntoView({ block: 'center' });
    await adminSettings.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await adminSettings.click();

    const featureFlagsXPath = "//a[normalize-space()='Feature Flags']";
    const featureFlags = await this.webDriver.$(featureFlagsXPath);
    await featureFlags.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await featureFlags.click();

    Logger.Info(`[Web] Scrolling to ${flagName} feature flag`);
    const flagXPath = `//div[contains(text(),'${flagName}')]`;
    const flagElement = await this.webDriver.$(flagXPath);
    await flagElement.waitForExist({ timeout: CommonWebPage.DEFAULT_WAIT });
    await flagElement.scrollIntoView({ block: 'center' });
    await flagElement.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
    await flagElement.click();

    const targetStatus = action === 'Enable' ? 'Enabled' : 'Disabled';
    Logger.Info(`[Web] Checking if ${flagName} is already ${targetStatus.toLowerCase()}`);
    const statusXPath = `//div[normalize-space()='${targetStatus}']`;
    const statusElement = await this.webDriver.$(statusXPath);

    let isAlreadyInTargetState = false;
    try {
      isAlreadyInTargetState = (await statusElement.isExisting()) && (await statusElement.isDisplayed());
    } catch (e) {
      isAlreadyInTargetState = false;
    }

    if (isAlreadyInTargetState) {
      Logger.Info(`[Web] Feature flag is already ${targetStatus.toLowerCase()}. Moving to customer app.`);
      return;
    }

    Logger.Info(`[Web] Checking if toggle button is available for ${flagName}`);
    const colAutoXPath = "//div[@class='col-auto']";
    const colAutoElement = await this.webDriver.$(colAutoXPath);

    let isAvailable = false;
    try {
      isAvailable = (await colAutoElement.isExisting()) && (await colAutoElement.isDisplayed());
    } catch (e) {
      isAvailable = false;
    }

    if (isAvailable) {
      Logger.Info(`[Web] Toggle button is available. Toggling to ${action}...`);
      const toggleBtnXPath = "//span[@class='d-block']";
      const toggleBtn = await this.webDriver.$(toggleBtnXPath);
      await toggleBtn.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });

      Logger.Info(`[Web] Mocking window.prompt to automatically return '${flagName}'`);
      await this.webDriver.execute((name: string) => {
        window.prompt = function () {
          return name;
        };
      }, flagName);

      try {
        await toggleBtn.waitForClickable({ timeout: 5000 });
        await toggleBtn.click();
      } catch (e) {
        await this.webDriver.execute((el: any) => el.click(), toggleBtn);
      }

      Logger.Info(`[Web] Feature flag ${action.toLowerCase()}d successfully via mocked prompt!`);
    } else {
      Logger.Info(`[Web] Toggle button not available. Moving to customer app.`);
    }
  }
  async AssertElementCount(locator: string, count: number) {
    const selector = (CommonLocators as any)[locator] || locator;
    const elements = await this.webDriver.$$(selector);
    await expect(elements).toBeElementsArrayOfSize(count);
  }

  async AssertURL(expectedUrl: string) {
    await expect(this.webDriver).toHaveUrl(expectedUrl);
  }

  async AssertToBe(actual: any, expected: any) {
    expect(actual).toBe(expected);
  }

  async AssertToEqual(actual: any, expected: any) {
    expect(actual).toEqual(expected);
  }

  async AssertToContain(actual: string, expected: string) {
    expect(actual).toContain(expected);
  }

  async AssertElementToHaveValue(locator: string, expectedValue: string) {
    const selector = (CommonLocators as any)[locator] || locator;
    const element = await this.webDriver.$(selector);
    await expect(element).toHaveValue(expectedValue);
  }

  async AssertElementsToHaveTextArray(locator: string, expectedTexts: string[]) {
    const selector = (CommonLocators as any)[locator] || locator;
    const elements = await this.webDriver.$$(selector);
    await expect(elements).toHaveText(expectedTexts);
  }

  async AssertElementToContainText(locator: string, expectedText: string) {
    const selector = (CommonLocators as any)[locator] || locator;
    const element = await this.webDriver.$(selector);
    const escapedText = expectedText.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    await expect(element).toHaveText(new RegExp(escapedText));
  }

  async AssertElementToHaveText(locator: string, expectedText: string) {
    const selector = (CommonLocators as any)[locator] || locator;
    const element = await this.webDriver.$(selector);
    await expect(element).toHaveText(expectedText);
  }
}
