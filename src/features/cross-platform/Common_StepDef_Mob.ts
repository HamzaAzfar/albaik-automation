import { Given, When, Then } from '@cucumber/cucumber';
import { CommonFunctionPage } from '../../pages/cross-platform/Common_Pages_Mob';

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

Then(/^I capture the total amount with locator "([^"]*)" and store it as "([^"]*)"$/, async (locator: string, key: string) => {
    await commonFunctionPage.captureAndStoreAmount(locator, key);
});

Then(/^I compare both stored amounts "([^"]*)" and "([^"]*)" and pass$/, async (key1: string, key2: string) => {
    await commonFunctionPage.compareStoredAmounts(key1, key2);
});