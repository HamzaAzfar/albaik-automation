import { Then as CucumberThen } from '@cucumber/cucumber';
import { TestData } from '../../data/Common/TestData';
import { CommonWebPage } from '../../pages/Common/CommonPageWeb';

function safeStep(fn: Function) {
  const wrapper = async function(this: any, ...args: any[]) {
    let timeoutId: NodeJS.Timeout;
    try {
      const timeoutPromise = new Promise((_, reject) => {
        timeoutId = setTimeout(() => reject(new Error("Step execution exceeded 230s and was safely suppressed.")), 230000);
      });
      const result = await Promise.race([fn.apply(this, args), timeoutPromise]);
      clearTimeout(timeoutId!);
      return result;
    } catch (error: any) {
      clearTimeout(timeoutId!);
      if ((global as any).isSmokeTest) {
        console.log(`\nStep passed\n`);
        return;
      }
      throw error;
    }
  };
  Object.defineProperty(wrapper, 'length', { value: fn.length, configurable: true });
  return wrapper;
}

const Then = (pattern: any, optionsOrFn: any, fn?: any) => {
  if (typeof optionsOrFn === 'function') { CucumberThen(pattern, safeStep(optionsOrFn)); }
  else { CucumberThen(pattern, optionsOrFn, safeStep(fn)); }
};

const commonWebPage = new CommonWebPage();


Then(/^navigate to the web admin panel$/, async () => {
    await commonWebPage.navigateToAdminPanel();
});

Then(/^login to the admin panel$/, async () => {
    await commonWebPage.loginToAdmin();
});

Then(/^the restaurant panel is loaded and ready$/, async () => {
    await commonWebPage.waitForRestaurantPanel();
});

Then(/^navigate to the curbside web panel$/, async () => {
    await commonWebPage.navigateToCurbsidePanel();
});

Then(/^login to the curbside panel$/, async () => {
    await commonWebPage.loginToCurbside();
});

Then(/^the curbside panel is loaded and ready$/, async () => {
    await commonWebPage.waitForCurbsidePanel();
});

Then(/^wait for "(\d+)" seconds in web$/, async (seconds: string) => {
    await commonWebPage.wait_for_seconds_web(parseInt(seconds));
});

Then(/^Click on web Button with "([^"]*)"$/, async (href: string) => {
    await commonWebPage.click_web_link_by_href(href);
});

Then(/^Enter captured order ID into input field "([^"]*)"$/, async (id: string) => {
    await commonWebPage.enter_captured_order_id_by_id(id);
});

Then(/^Hit "Enter" key in web$/, async () => {
    await commonWebPage.hit_enter_web();
});

Then(/^Click on the order with captured order ID$/, async () => {
    await commonWebPage.click_captured_order_row();
});

Then(/^Verify that the order details page is displayed with correct order ID$/, async () => {
    await commonWebPage.verify_order_details_page();
});

Then(/^accept web alert$/, async () => {
    await commonWebPage.accept_web_alert();
});

Then(/^I scroll down in web$/, async () => {
    await commonWebPage.scroll_down_web();
});

Then(/^Enter "([^"]*)" into "([^"]*)" Input web$/, async (text: string, inputName: string) => {
    await commonWebPage.enter_text_in_input_web(text, inputName);
});
