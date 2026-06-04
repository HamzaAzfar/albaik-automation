import {CommonFunctionPage, Then, When, Given} from '../../pages/Common/CommonPageMob';

const commonFunctionPage = new CommonFunctionPage(); 

 Given('The Albaik application is launched', async () => {
  await commonFunctionPage.waitForHomeScreen();
  await commonFunctionPage.wait_for_seconds(5);
});
Given('The Albaik application is launched on emulator', async () => {
  await commonFunctionPage.waitForHomeScreen();
  await commonFunctionPage.wait_for_seconds(5);
});
Given('The Albaik application is launched on physical device', async () => {
  await commonFunctionPage.waitForHomeScreen();
  await commonFunctionPage.wait_for_seconds(5);
});
Given('The Albaik Driver application is launched', async () => {
  await commonFunctionPage.launchDriverApplication();
  await commonFunctionPage.wait_for_seconds(5);
});

Then('Close the Albaik application', async () => {
  await commonFunctionPage.closeCustomerApplication();
});
Then('Close the Albaik application on physical device', async () => {
  await commonFunctionPage.closeCustomerApplication();
});
Given('The Albaik Driver application is launched on emulator', async () => {
  await commonFunctionPage.launchDriverApplication();
  await commonFunctionPage.wait_for_seconds(5);
});
Given('The Albaik Driver application is launched on physical device', async () => {
  await commonFunctionPage.launchDriverApplication();
  await commonFunctionPage.wait_for_seconds(5);
});



Then('Verify that the {string} text is displayed', async (text: string) => {
  await commonFunctionPage.verify_txt(text);
});
Then('wait untill {string} text is displayed', async (text: string) => {
  await commonFunctionPage.wait_until_txt_displayed(text);
});

Then('I sign out if already signed in', async () => {
  await commonFunctionPage.signOutIfSignedIn();
});


Then('Click on {string} button', async (text: string) => {
  await commonFunctionPage.click_btn(text);
});

Then('Click on profile icon', async () => {
  await commonFunctionPage.click_profile_icon();
});

Then(/^wait for "?(\d+)"? [sS]econds?\s*$/, { timeout: 600000 }, async (seconds: string) => {
  await commonFunctionPage.wait_for_seconds(parseInt(seconds));
});

Then('Complete dynamic checkout with CVV {string}', async (cvv: string) => {
    await commonFunctionPage.handle_dynamic_checkout(cvv);
});

Then(/^Scroll down "(\d+)" lines?$/, async (lines: string) => {
  await commonFunctionPage.scrollDownLines(parseInt(lines));
});

Then(/^Swipe left "(\d+)" times?$/, async (times: string) => {
  await commonFunctionPage.swipeLeft(parseInt(times));
});

Then(/^Swipe left "(\d+)" times? on "([^"]*)" section$/, async (times: string, section: string) => {
  await commonFunctionPage.swipeLeftOnElement(parseInt(times), section);
});

Then('Write {string} in the input field', async (text: string) => {
  await commonFunctionPage.write_in_input_field(text);
});

Then('Enter {string} into {string} Input', async (text: string, inputName: string) => {
  await commonFunctionPage.enter_text_in_input_field(text, inputName);
});

Then('Enter captured order ID into {string} Input', async (inputName: string) => {
  await commonFunctionPage.enter_captured_order_id_in_input_field(inputName);
});

Then(/^Hit "([^"]*)" key$/, async (keyName: string) => {
    await commonFunctionPage.hit_key(keyName);
});
Then('Enter password', async () => {
  await commonFunctionPage.enter_password();
});

Then('Enter {string} as password', async (password: string) => {
  await commonFunctionPage.enter_password(password);
});

Then('Select card ending with {string}', async (lastFourDigits: string) => {
  await commonFunctionPage.select_card_ending_with(lastFourDigits);
});
Then(
  'Capture and store order id from tracking card {string}',
  async (trackingCardId: string) => {
    await commonFunctionPage.capture_and_store_order_id(
      trackingCardId
    );
  }
);





When('I redirect to branch {string} to bypass QR scan', async (branchId: string) => {
    await commonFunctionPage.redirectToBranchViaIntent(branchId);
});

Then(/^I capture the total amount with locator "([^"]*)" and store it as "([^"]*)"$/, async (locator: string, key: string) => {
    await commonFunctionPage.captureAndStoreAmount(locator, key);
});

Then(/^I compare both stored amounts "([^"]*)" and "([^"]*)" and pass$/, async (key1: string, key2: string) => {
    await commonFunctionPage.compareStoredAmounts(key1, key2);
});

Then(/^Open the link "([^"]*)" in mobile browser$/, async (url: string) => {
    await commonFunctionPage.openLinkInMobileBrowser(url);
});


When(/^I click button "([^"]*)"$/, async (btnName: string) => {
    await commonFunctionPage.click_btn(btnName);
});

Then(/^I verify text "([^"]*)" is displayed$/, async (text: string) => {
    await commonFunctionPage.verify_txt(text);
});

When(/^I enter "([^"]*)" in "([^"]*)" input field$/, async (textToEnter: string, inputName: string) => {
    await commonFunctionPage.enter_text_in_input_field(textToEnter, inputName);
});

When(/^I scroll down (\d+) lines$/, async (lines: number) => {
    await commonFunctionPage.scrollDownLines(lines);
});

When(/^I wait for (\d+) seconds$/, async (seconds: number) => {
    await commonFunctionPage.wait_for_seconds(seconds);
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



Then(/^Open the link "([^"]*)" in mobile browser$/, async (link: string) => {
    await commonFunctionPage.open_link_in_mobile_browser(link);
});
When(/^I click button "([^"]*)"$/, async (btnName: string) => {
    await commonFunctionPage.click_btn(btnName);
});

Then(/^I verify text "([^"]*)" is displayed$/, async (text: string) => {
    await commonFunctionPage.verify_txt(text);
});

When(/^I enter "([^"]*)" in "([^"]*)" input field$/, async (textToEnter: string, inputName: string) => {
    await commonFunctionPage.enter_text_in_input_field(textToEnter, inputName);
});

When(/^I scroll down (\d+) lines$/, async (lines: number) => {
    await commonFunctionPage.scrollDownLines(lines);
});

Then(/^I capture the total amount with locator "([^"]*)" and store it as "([^"]*)"$/, async (locator: string, key: string) => {
    await commonFunctionPage.captureAndStoreAmount(locator, key);
});

Then(/^I compare both stored amounts "([^"]*)" and "([^"]*)" and pass$/, async (key1: string, key2: string) => {
    await commonFunctionPage.compareStoredAmounts(key1, key2);
});