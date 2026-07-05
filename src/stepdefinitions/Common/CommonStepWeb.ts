import { CommonWebPage, Then, Given, When } from '../../pages/Common/CommonPageWeb';

const commonWebPage = new CommonWebPage();

Then(/^the restaurant panel is loaded and ready$/, async () => {
  await commonWebPage.WaitForRestaurantPanel();
});

When(/^Click on web Button with "([^"]*)"$/, async (href: string) => {
  await commonWebPage.ClickWebLinkByHref(href);
});

When(/^Enter captured order ID into input field "([^"]*)"$/, async (id: string) => {
  await commonWebPage.EnterCapturedOrderIdById(id);
});

When(/^Hit "Enter" key in web$/, async () => {
  await commonWebPage.HitEnterWeb();
});

When(/^Click on the order with captured order ID$/, async () => {
  await commonWebPage.ClickCapturedOrderRow();
});

Then(/^Verify that the order details page is displayed with correct order ID$/, async () => {
  await commonWebPage.VerifyOrderDetailsPage();
});

When(/^accept web alert$/, async () => {
  await commonWebPage.AcceptWebAlert();
});

When(/^I scroll down in web$/, async () => {
  await commonWebPage.ScrollDownWeb();
});

When(/^Enter "([^"]*)" into "([^"]*)" Input web$/, async (text: string, inputName: string) => {
  await commonWebPage.EnterTextInInputWeb(text, inputName);
});

Then(/^Verify "([^"]*)" text on web$/, async (text: string) => {
  await commonWebPage.VerifyTextOnWeb(text);
});

Then(/^"([^"]*)" flag of "([^"]*)" in admin panel$/, async (action: string, flagName: string) => {
  const formattedAction = action.charAt(0).toUpperCase() + action.slice(1).toLowerCase();
  await commonWebPage.ToggleFeatureFlag(flagName, formattedAction as 'Enable' | 'Disable');
});



Then(
  /^If "([^"]*)" text is available on web, click on "([^"]*)" button$/,
  async (textToCheck: string, textToClick: string) => {
    await commonWebPage.ClickIfTextAvailable(textToCheck, textToClick);
  },
);
