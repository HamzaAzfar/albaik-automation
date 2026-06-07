import {CommonFunctionPage, Then, When, Given} from '../../pages/Common/CommonPageMob';

const commonFunctionPage = new CommonFunctionPage(); 

 Given('The Albaik application is launched', async () => {
  await commonFunctionPage.WaitForHomeScreen();
  await commonFunctionPage.WaitForSeconds(5);
});
Given('The Albaik application is launched on emulator', async () => {
  await commonFunctionPage.WaitForHomeScreen();
  await commonFunctionPage.WaitForSeconds(5);
});
Given('The Albaik application is launched on physical device', async () => {
  await commonFunctionPage.WaitForHomeScreen();
  await commonFunctionPage.WaitForSeconds(5);
});
Given('The Albaik Driver application is launched', async () => {
  await commonFunctionPage.LaunchDriverApplication();
  await commonFunctionPage.WaitForSeconds(5);
});

Then('Close the Albaik application', async () => {
  await commonFunctionPage.CloseCustomerApplication();
});
Then('Close the Albaik application on physical device', async () => {
  await commonFunctionPage.CloseCustomerApplication();
});
Given('The Albaik Driver application is launched on emulator', async () => {
  await commonFunctionPage.LaunchDriverApplication();
  await commonFunctionPage.WaitForSeconds(5);
});
Given('The Albaik Driver application is launched on physical device', async () => {
  await commonFunctionPage.LaunchDriverApplication();
  await commonFunctionPage.WaitForSeconds(5);
});



Then('Verify that the {string} text is displayed', async (text: string) => {
  await commonFunctionPage.VerifyTxt(text);
});
Then('wait untill {string} text is displayed', async (text: string) => {
  await commonFunctionPage.WaitUntilTxtDisplayed(text);
});

Then('I sign out if already signed in', async () => {
  await commonFunctionPage.SignOutIfSignedIn();
});


Then('Click on {string} button', async (text: string) => {
  await commonFunctionPage.ClickBtn(text);
});

Then('Click on profile icon', async () => {
  await commonFunctionPage.ClickProfileIcon();
});

Then(/^wait for "?(\d+)"? [sS]econds?\s*$/, { timeout: 600000 }, async (seconds: string) => {
  await commonFunctionPage.WaitForSeconds(parseInt(seconds));
});

Then('Complete dynamic checkout with CVV {string}', async (cvv: string) => {
    await commonFunctionPage.HandleDynamicCheckout(cvv);
});

Then(/^Scroll down "(\d+)" lines?$/, async (lines: string) => {
  await commonFunctionPage.ScrollDownLines(parseInt(lines));
});

Then(/^Swipe left "(\d+)" times?$/, async (times: string) => {
  await commonFunctionPage.SwipeLeft(parseInt(times));
});

Then(/^Swipe left "(\d+)" times? on "([^"]*)" section$/, async (times: string, section: string) => {
  await commonFunctionPage.SwipeLeftOnElement(parseInt(times), section);
});

Then('Write {string} in the input field', async (text: string) => {
  await commonFunctionPage.WriteInInputField(text);
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
Then('Enter password', async () => {
  await commonFunctionPage.EnterPassword();
});

Then('Enter {string} as password', async (password: string) => {
  await commonFunctionPage.EnterPassword(password);
});

Then('Select card ending with {string}', async (lastFourDigits: string) => {
  await commonFunctionPage.SelectCardEndingWith(lastFourDigits);
});
Then(
  'Capture and store order id from tracking card {string}',
  async (trackingCardId: string) => {
    await commonFunctionPage.CaptureAndStoreOrderId(
      trackingCardId
    );
  }
);





When('I redirect to branch {string} to bypass QR scan', async (branchId: string) => {
    await commonFunctionPage.RedirectToBranchViaIntent(branchId);
});

Then(/^I capture the total amount with locator "([^"]*)" and store it as "([^"]*)"$/, async (locator: string, key: string) => {
    await commonFunctionPage.CaptureAndStoreAmount(locator, key);
});

Then(/^I compare both stored amounts "([^"]*)" and "([^"]*)" and pass$/, async (key1: string, key2: string) => {
    await commonFunctionPage.CompareStoredAmounts(key1, key2);
});

Then(/^Open the link "([^"]*)" in mobile browser$/, async (url: string) => {
    await commonFunctionPage.OpenLinkInMobileBrowser(url);
});


When(/^I click button "([^"]*)"$/, async (btnName: string) => {
    await commonFunctionPage.ClickBtn(btnName);
});

Then(/^I verify text "([^"]*)" is displayed$/, async (text: string) => {
    await commonFunctionPage.VerifyTxt(text);
});

When(/^I enter "([^"]*)" in "([^"]*)" input field$/, async (textToEnter: string, inputName: string) => {
    await commonFunctionPage.EnterTextInInputField(textToEnter, inputName);
});

When(/^I scroll down (\d+) lines$/, async (lines: number) => {
    await commonFunctionPage.ScrollDownLines(lines);
});

When(/^I wait for (\d+) seconds$/, async (seconds: number) => {
    await commonFunctionPage.WaitForSeconds(seconds);
});

const storedAmounts: { [key: string]: string } = {};

// Then(/^I capture the total amount with locator "([^"]*)" and store it as "([^"]*)"$/, async (locator: string, key: string) => {
//     const actualLocator = (CommonLocators as any)[locator] || locator;
//     const elements = await $$(actualLocator);
//     if (elements.length === 0) {
//         throw new Error(`Could not find any element with locator: ${actualLocator}`);
//     }
//     const text = await elements[elements.length - 1].getText();
//     storedAmounts[key] = text.trim();
// });

Then(/^I compare both stored amounts "([^"]*)" and "([^"]*)" and pass$/, async (key1: string, key2: string) => {
    const amount1 = storedAmounts[key1];
    const amount2 = storedAmounts[key2];
    if (amount1 !== amount2) {
        throw new Error(`Verification Failed! Amounts do not match. ${key1} = ${amount1}, ${key2} = ${amount2}`);
    }
});