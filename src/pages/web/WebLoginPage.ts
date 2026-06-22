import { CommonWebPage } from '../Common/CommonPageWeb';
import { MobileLocators } from '../../locators/Mobile/MobileLocator';
import { WebLocators } from '../../locators/Web/WebLocator';
import { DriverLocators } from '../../locators/Driver/DriverLocator';

const CommonLocators = { ...MobileLocators, ...WebLocators, ...DriverLocators };
import { Logger } from '../../utils/Logger';
import { WebSessionManager } from '../../services/WebSessionManager';

class WebLoginPage extends CommonWebPage {
  async NavigateToAdminPanel() {
    const webDriver = await WebSessionManager.initialize();
    try {
      await webDriver.maximizeWindow();
    } catch (e) {
      Logger.Warn(`[Web] Attempt to maximize window failed: ${e}`);
    }
    await webDriver.url(process.env.WEB_BASE_URL || '');
  }

  async LoginToAdmin() {
    const email = process.env.ADMIN_EMAIL || process.env.WEB_EMAIL;
    const password = process.env.ADMIN_PASSWORD || process.env.WEB_PASSWORD;

    if (!email || !password) {
      throw new Error('Admin credentials missing. Please set ADMIN_EMAIL and ADMIN_PASSWORD in your .env file');
    }

    const emailInput = await this.webDriver.$(CommonLocators.EmailInput);
    try {
      await emailInput.waitForDisplayed({ timeout: 5000 });
      await expect(emailInput).toBeDisplayed();
      await emailInput.setValue(email);

      const passwordInput = await this.webDriver.$(CommonLocators.WebPasswordInput);
      await expect(passwordInput).toBeDisplayed();
      await passwordInput.setValue(password);

      const loginBtn = await this.webDriver.$(CommonLocators.LoginBtn);
      await expect(loginBtn).toBeDisplayed();
      await loginBtn.click();
    } catch (error) {
      Logger.Info('[DEBUG] Admin login field not displayed within 5s. Assuming already logged in.');
    }
  }

  async NavigateToCurbsidePanel() {
    const webDriver = await WebSessionManager.initialize();
    try {
      await webDriver.maximizeWindow();
    } catch (e) {
      Logger.Warn(`[Web] Failed to maximize window (e.g., headless mode). Error: ${e}`);
    }
    const url = process.env.CURBSIDE_BASE_URL;
    if (!url) throw new Error('CURBSIDE_BASE_URL not set in .env');
    await webDriver.url(url);
  }

  async LoginToCurbside(phoneStr?: string, passStr?: string) {
    const phone = phoneStr || process.env.CURBSIDE_PHONE || process.env.MOBILE_PHONE_NUMBER;
    const pass = passStr || process.env.CURBSIDE_PASSWORD || process.env.MOBILE_PASSWORD;

    if (!phone || !pass) {
      throw new Error(
        'Curbside credentials missing. Please set CURBSIDE_PHONE and CURBSIDE_PASSWORD in your .env file',
      );
    }

    const loginField = await this.webDriver.$(CommonLocators.CurbsidePhoneInput);
    try {
      await loginField.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
      await expect(loginField).toBeDisplayed();
      await loginField.setValue(phone);

      const passwordInput = await this.webDriver.$(CommonLocators.WebPasswordInput);
      await expect(passwordInput).toBeDisplayed();
      await passwordInput.setValue(pass);

      const loginBtn = await this.webDriver.$(CommonLocators.LoginBtn);
      await expect(loginBtn).toBeDisplayed();
      await loginBtn.click();
    } catch (error) {
      Logger.Info('[DEBUG] Curbside login field not displayed within 10s. Assuming already logged in.');
    }
  }
}

export default new WebLoginPage();
