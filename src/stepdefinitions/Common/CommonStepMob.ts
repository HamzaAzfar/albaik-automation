import { CommonFunctionPage, Then, When, Given } from '../../pages/Common/CommonPageMob';
import LoginPage from '../../pages/mobile/LoginPage';
import CheckoutPage from '../../pages/mobile/CheckoutPage';
import ScanQRPage from '../../pages/mobile/ScanQRPage';

const commonFunctionPage = new CommonFunctionPage();

Given('The Albaik application is launched on physical device', async () => {
  await commonFunctionPage.WaitForHomeScreen();
});

Then('Close the Albaik application on physical device', async () => {
  await commonFunctionPage.CloseCustomerApplication();
});
Given('The Albaik Driver application is launched on physical device', async () => {
  await commonFunctionPage.LaunchDriverApplication();
});


Then('Verify that the {string} text is displayed', async (text: string) => {
  await commonFunctionPage.VerifyTxt(text);
});
Then('wait untill {string} text is displayed', async (text: string) => {
  await commonFunctionPage.WaitUntilTxtDisplayed(text);
});

Then('I sign out if already signed in', async () => {
  await LoginPage.SignOutIfSignedIn();
});


Then(/^Click on "([^"]*)" button$/, async (btn_name: string) => {
  await commonFunctionPage.ClickBtn(btn_name);
});

Then(/^Click on "([^"]*)" button until it disappears$/, async (btn_name: string) => {
  await commonFunctionPage.ClickUntilDisappears(btn_name);
});

Then('Click on profile icon', async () => {
  await commonFunctionPage.ClickProfileIcon();
});

Then('Complete dynamic checkout with CVV {string}', async (cvv: string) => {
  await CheckoutPage.HandleDynamicCheckout(cvv);
});

Then(/^Scroll "([^"]*)" until "([^"]*)" text is displayed$/, async (direction: string, targetText: string) => {
  await commonFunctionPage.Scroll(direction, targetText);
});

Then(/^Swipe "([^"]*)" until "([^"]*)" text is displayed$/, async (direction: string, targetText: string) => {
  await commonFunctionPage.Swipe(direction, targetText);
});

Then(/^Swipe "([^"]*)" on "([^"]*)" section until "([^"]*)" text is displayed$/, async (direction: string, section: string, targetText: string) => {
  await commonFunctionPage.SwipeOnElement(direction, section, targetText);
});

Then(/^I verify text "([^"]*)" is displayed$/, async (text: string) => {
  await commonFunctionPage.VerifyTxt(text);
});


Then('Enter {string} into {string} Input', async (text: string, inputName: string) => {
  await commonFunctionPage.EnterTextInInputField(text, inputName);
});

Then('Enter captured order ID into {string} Input', async (inputName: string) => {
  await commonFunctionPage.EnterCapturedOrderIdInInputField(inputName);
});

Then(/^Hit "([^"]*)" key$/, async (keyName: string) => {
  await commonFunctionPage.HitKey(keyName);
});

Then('Enter {string} as password', async (password: string) => {
  await LoginPage.EnterPassword(password);
});


Then(
  'Capture and store order id from tracking card {string}',
  async (trackingCardId: string) => {
    await CheckoutPage.CaptureAndStoreOrderId(
      trackingCardId
    );
  }
);

Then('Turn on Mobile location', async () => {
  await commonFunctionPage.TurnOnMobileLocation();
});

Then('Kill app and open it again', async () => {
  await commonFunctionPage.KillAndReopenApp();
});





When('I redirect to branch {string} to bypass QR scan', async (branchId: string) => {
  await ScanQRPage.RedirectToBranchViaIntent(branchId);
});

Then(/^I capture the total amount with locator "([^"]*)" and store it as "([^"]*)"$/, async (locator: string, key: string) => {
  await CheckoutPage.CaptureAndStoreAmount(locator, key);
});

Then(/^I compare both stored amounts "([^"]*)" and "([^"]*)" and pass$/, async (key1: string, key2: string) => {
  await CheckoutPage.CompareStoredAmounts(key1, key2);
});

Then(/^Open the link "([^"]*)" in mobile browser$/, async (url: string) => {
  await commonFunctionPage.OpenLinkInMobileBrowser(url);
});

