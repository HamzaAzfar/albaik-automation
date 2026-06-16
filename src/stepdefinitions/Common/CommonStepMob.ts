import { CommonFunctionPage, Then, When, Given } from '../../pages/Common/CommonPageMob';
import { DataStore } from '../../services/DataStore';


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

Then(/^Verify any Arabic text is displayed on the screen$/, async () => {
  await commonFunctionPage.VerifyAnyArabicTextDisplayed();
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






Then('Turn on Mobile location', async () => {
  await commonFunctionPage.TurnOnMobileLocation();
});

Then(/^Click on the mobile order card with captured order ID$/, async () => {
  const orderId = DataStore.get('orderId');
  if (!orderId) {
    throw new Error("No captured order ID found in DataStore");
  }
  
  await commonFunctionPage.ClickCapturedOrderCard(orderId);
});

Then('Kill app and open it again', async () => {
  await commonFunctionPage.KillAndReopenApp();
});







Then(/^Open the link "([^"]*)" in mobile browser$/, async (url: string) => {
  await commonFunctionPage.OpenLinkInMobileBrowser(url);
});

