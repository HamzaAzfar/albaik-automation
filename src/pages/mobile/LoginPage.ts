import { CommonFunctionPage } from '../Common/CommonPageMob';
import { Logger } from '../../utils/Logger';
import { CommonLocators } from '../../locators/Common/CommonLocator';

class LoginPage extends CommonFunctionPage {

  async SignOutIfSignedIn() {
    try {
      Logger.Info("Checking if user is already signed in...");
      const signOutSelectors = this.BuildTextSelectors("Sign out");
      const signOutBtn = await this.FindFirstDisplayed(signOutSelectors, 5000);

      if (signOutBtn) {
        await signOutBtn.click();


        const menuLocator = CommonLocators.SystemButton("android:id/content");
        const menuBtn = await this.browserInstance.$(menuLocator);
        await menuBtn.waitForDisplayed({ timeout: 10000 });
        await expect(menuBtn).toBeDisplayed();

        await this.ClickBtn("android:id/content");
      } else {
        Logger.Info(" 'Sign out' not found. Assuming user is not signed in.");
      }
    } catch (e) {
      Logger.Info(` Error checking sign out state, proceeding... ${e}`);
    }
  }

  async EnterPassword(password?: string) {
    const text = password || process.env.MOBILE_PASSWORD;
    if (!text) {
      throw new Error("Mobile password missing. Please set MOBILE_PASSWORD in your .env file or pass it to the step.");
    }

    const element = await this.browserInstance.$(CommonLocators.PasswordInput);
    await element.waitForDisplayed({ timeout: CommonFunctionPage.DEFAULT_WAIT });
    await expect(element).toBeDisplayed();
    await element.setValue(text);
  }
}

export default new LoginPage();
