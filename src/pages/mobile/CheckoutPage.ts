import { CommonFunctionPage } from '../Common/CommonPageMob';
import { Logger } from '../../utils/Logger';
import { MobileLocators } from '../../locators/Mobile/MobileLocator';
import { WebLocators } from '../../locators/Web/WebLocator';
import { DriverLocators } from '../../locators/Driver/DriverLocator';

const CommonLocators = { ...MobileLocators, ...WebLocators, ...DriverLocators };
import { DataStore } from '../../services/DataStore';

class CheckoutPage extends CommonFunctionPage {
  async HandleDynamicCheckout(cvv: string) {
    Logger.Info('[Dynamic Checkout] Checking which checkout layout is currently active...');
    try {
      const continueSelectors = this.BuildTextSelectors('Continue');
      const element = await this.FindFirstDisplayed(continueSelectors, 10000);

      if (!element) {
        throw new Error('Continue button not found, assuming previous layout.');
      }

      await element.click();

      const cvvLocator = CommonLocators.DynamicTextInput('checkoutCvv');
      const cvvElement = await this.browserInstance.$(cvvLocator);
      await cvvElement.waitForDisplayed({ timeout: 15000 });
      await expect(cvvElement).toBeDisplayed();

      await this.EnterTextInInputField(cvv, 'checkoutCvv');
      await this.ClickBtn('Pay with card');
      Logger.Info('[Dynamic Checkout] Successfully executed the ORIGINAL UPDATED checkout flow.');
    } catch (error: any) {
      Logger.Info(`[Dynamic Checkout] Updated layout not detected. Error: ${error.message}`);
      Logger.Info('[Dynamic Checkout] Falling back to the OTHER PREVIOUS checkout layout...');

      const cardName = process.env.TEST_CARD_NAME || '';
      const cardNumber = process.env.TEST_CARD_NUMBER || '';
      const cardExpiry = process.env.TEST_CARD_EXPIRY || '';

      if (!cardName || !cardNumber || !cardExpiry) {
        throw new Error(
          'Test card details missing. Please set TEST_CARD_NAME, TEST_CARD_NUMBER, and TEST_CARD_EXPIRY in your .env file',
        );
      }

      await this.ClickBtn('Credit / Debit');
      await this.EnterTextInInputField(cardName, 'card_holder_name_input');
      await this.EnterTextInInputField(cardNumber, 'card_number_input');
      await this.EnterTextInInputField(cardExpiry, 'expiry_date_input');
      await this.EnterTextInInputField(cvv, 'cvv_input');
    }
  }

  async SelectCardEndingWith(lastFourDigits: string) {
    const locator = CommonLocators.CardEndingWith(lastFourDigits);
    const element = await this.browserInstance.$(locator);
    await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();
    await element.click();
  }

  async CaptureAndStoreOrderId(trackingCardId: string) {
    const orderIdLocator = CommonLocators.TrackingOrderId(trackingCardId);
    const orderIdElement = await this.browserInstance.$(orderIdLocator);
    await orderIdElement.waitForDisplayed({ timeout: 20000 });
    await expect(orderIdElement).toBeDisplayed();
    const fullText = await orderIdElement.getText();

    // Example => #S71582
    const orderId = fullText.replace('#', '').trim();
    DataStore.set('orderId', orderId);
    Logger.Info(`Captured Order ID: ${DataStore.get('orderId')}`);
  }

  async CaptureAndStoreAmount(locatorKey: string, key: string) {
    let driver: any;
    if ((browser as any).isMultiremote) {
      driver = (this.browserInstance as any).mobile;
    } else {
      driver = this.browserInstance;
    }

    const oldValue = DataStore.get(key);
    DataStore.set(key, undefined);
    Logger.Info(`[captureAndStoreAmount] Cleared old value for key: "${key}" (was: "${oldValue}")`);

    const actualLocator = (CommonLocators as any)[locatorKey] || locatorKey;
    Logger.Info(`[captureAndStoreAmount] Using locator: ${actualLocator}`);

    try {
      await this.browserInstance.$(actualLocator).waitForExist({ timeout: 5000 });
    } catch (e) {
      Logger.Warn(`[captureAndStoreAmount] Element ${actualLocator} did not exist within 5000ms`);
    }

    const elements = await driver.$$(actualLocator);
    Logger.Info(`[captureAndStoreAmount] Found ${elements.length} elements with locator`);

    if (elements.length === 0) {
      throw new Error(`Could not find any element with locator: ${actualLocator}`);
    }

    const visibleAmounts: Array<{ text: string; value: number; index: number }> = [];

    for (let i = 0; i < elements.length; i++) {
      try {
        const isDisplayed = await elements[i].isDisplayed();
        const text = await elements[i].getText();
        Logger.Info(`[captureAndStoreAmount] Element [${i}]: "${text}" | isDisplayed: ${isDisplayed}`);

        if (isDisplayed) {
          const numMatch = text.match(/[\d.,]+/);
          if (numMatch) {
            const numValue = parseFloat(numMatch[0].replace(/,/g, ''));
            visibleAmounts.push({ text: text.trim(), value: numValue, index: i });
          }
        }
      } catch (e) {
        Logger.Info(`[captureAndStoreAmount] Element [${i}]: Could not check visibility`);
      }
    }

    if (visibleAmounts.length === 0) {
      throw new Error(`No visible elements with numeric amounts found using locator: ${actualLocator}`);
    }

    visibleAmounts.sort((a, b) => b.value - a.value);
    const largestAmount = visibleAmounts[0];

    DataStore.set(key, largestAmount.text);
    Logger.Info(
      `[captureAndStoreAmount] Captured LARGEST visible amount: "${largestAmount.text}" (${largestAmount.value}) from element [${largestAmount.index}] and stored as key: "${key}"`,
    );
  }

  async CompareStoredAmounts(key1: string, key2: string) {
    const amount1 = DataStore.get(key1);
    const amount2 = DataStore.get(key2);

    if (amount1 !== amount2) {
      throw new Error(`Verification Failed! Amounts do not match. ${key1} = ${amount1}, ${key2} = ${amount2}`);
    }

    Logger.Info(`Verification Passed! ${key1} (${amount1}) matches ${key2} (${amount2})`);
  }
}

export default new CheckoutPage();
