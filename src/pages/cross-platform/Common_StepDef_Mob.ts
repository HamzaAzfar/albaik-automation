import { Given, When, Then } from '@cucumber/cucumber';
import { CommonFunctionPage } from '../../pages/cross-platform/Common_Pages_Mob';
import { CommonLocators } from '../../locators/Common/CommonLocator';

const commonFunctionPage = new CommonFunctionPage();

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