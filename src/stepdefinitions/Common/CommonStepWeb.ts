import { TestData } from '../../data/Common/TestData';
import { CommonWebPage, Then } from '../../pages/Common/CommonPageWeb';

const commonWebPage = new CommonWebPage();


Then(/^navigate to the web admin panel$/, async () => {
    await commonWebPage.NavigateToAdminPanel();
});

Then(/^login to the admin panel$/, async () => {
    await commonWebPage.LoginToAdmin();
});

Then(/^the restaurant panel is loaded and ready$/, async () => {
    await commonWebPage.WaitForRestaurantPanel();
});

Then(/^navigate to the curbside web panel$/, async () => {
    await commonWebPage.NavigateToCurbsidePanel();
});

Then(/^login to the curbside panel$/, async () => {
    await commonWebPage.LoginToCurbside();
});

Then(/^the curbside panel is loaded and ready$/, async () => {
    await commonWebPage.WaitForCurbsidePanel();
});

Then(/^wait for "(\d+)" seconds in web$/, async (seconds: string) => {
    await commonWebPage.WaitForSecondsWeb(parseInt(seconds));
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
