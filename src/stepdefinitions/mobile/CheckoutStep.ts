import { Then, Given, When } from '../../pages/Common/CommonPageMob';
import CheckoutPage from '../../pages/mobile/CheckoutPage';

When('Complete dynamic checkout with CVV {string}', async (cvv: string) => {
  await CheckoutPage.HandleDynamicCheckout(cvv);
});

When('Capture and store order id from tracking card {string}', async (trackingCardId: string) => {
  await CheckoutPage.CaptureAndStoreOrderId(trackingCardId);
});

Then(
  /^I capture the total amount with locator "([^"]*)" and store it as "([^"]*)"$/,
  async (locator: string, key: string) => {
    await CheckoutPage.CaptureAndStoreAmount(locator, key);
  },
);

Then(/^I compare both stored amounts "([^"]*)" and "([^"]*)" and pass$/, async (key1: string, key2: string) => {
  await CheckoutPage.CompareStoredAmounts(key1, key2);
});
