import { CommonWebPage, Then } from '../../pages/Common/CommonPageWeb';


const commonWebPage = new CommonWebPage();




Then(/^the restaurant panel is loaded and ready$/, async () => {
    await commonWebPage.WaitForRestaurantPanel();
});







Then(/^Click on web Button with "([^"]*)"$/, async (href: string) => {
    await commonWebPage.ClickWebLinkByHref(href);
});

Then(/^Enter captured order ID into input field "([^"]*)"$/, async (id: string) => {
    await commonWebPage.EnterCapturedOrderIdById(id);
});

Then(/^Hit "Enter" key in web$/, async () => {
    await commonWebPage.HitEnterWeb();
});

Then(/^Click on the order with captured order ID$/, async () => {
    await commonWebPage.ClickCapturedOrderRow();
});

Then(/^Verify that the order details page is displayed with correct order ID$/, async () => {
    await commonWebPage.VerifyOrderDetailsPage();
});

Then(/^accept web alert$/, async () => {
    await commonWebPage.AcceptWebAlert();
});

Then(/^I scroll down in web$/, async () => {
    await commonWebPage.ScrollDownWeb();
});

Then(/^Enter "([^"]*)" into "([^"]*)" Input web$/, async (text: string, inputName: string) => {
    await commonWebPage.EnterTextInInputWeb(text, inputName);
});

Then(/^Verify "([^"]*)" text on web$/, async (text: string) => {
    await commonWebPage.VerifyTextOnWeb(text);
});

Then(/^Disable quick register feature flag in admin panel$/, async () => {
    await commonWebPage.DisableQuickRegisterFeature();
});
