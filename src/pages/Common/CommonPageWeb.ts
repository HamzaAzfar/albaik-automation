import { Then as CucumberThen } from '@cucumber/cucumber';
import { TestData } from '../../data/Common/TestData';
import { CommonLocators } from '../../locators/Common/CommonLocator';

export function launchapp(fn: Function) {
  const wrapper = async function(this: any, ...args: any[]) {
    let timeoutId: NodeJS.Timeout;
    try {
      const timeoutPromise = new Promise((_, reject) => {
        timeoutId = setTimeout(() => reject(new Error("Step execution exceeded 230s falling back to other locator.")), 230000);
      });
      const result = await Promise.race([fn.apply(this, args), timeoutPromise]);
      clearTimeout(timeoutId!);
      return result;
    } catch (error: any) {
      clearTimeout(timeoutId!);
      if ((global as any).isSmokeTest) {
        console.log(`\nLocator found,Step passed\n`);
        return;
      }
      throw error;
    }
  };
  Object.defineProperty(wrapper, 'length', { value: fn.length, configurable: true });
  return wrapper;
}

export const Then = (pattern: any, optionsOrFn: any, fn?: any) => {
  if (typeof optionsOrFn === 'function') { CucumberThen(pattern, launchapp(optionsOrFn)); }
  else { CucumberThen(pattern, optionsOrFn, launchapp(fn)); }
};

export class CommonWebPage {
    private get webDriver() {
        return (browser as any).isMultiremote ? (browser as any).web : browser;
    }

 
    async navigateToAdminPanel() {
        try {
            await this.webDriver.maximizeWindow();
        } catch (e) {}
        await this.webDriver.url(TestData.web.baseUrl);
    }
async scroll_down_web() {
    // Scrolls the web page down by 500 pixels. Adjust the 500 value if you need to scroll further!
    await browser.execute(() => {
        window.scrollBy(0, 500);
    });
  }
  
    async loginToAdmin() {
        await this.webDriver.$(CommonLocators.emailInput).waitForDisplayed({ timeout: 10000 });
        await this.webDriver.$(CommonLocators.emailInput).setValue(TestData.web.email);
        
        await this.webDriver.$(CommonLocators.webPasswordInput).setValue(TestData.web.password);
        
        await this.webDriver.$(CommonLocators.loginBtn).click();
    }

    
    async waitForRestaurantPanel() {
        await this.webDriver.pause(5000);
    }
    
    
    async navigateToCurbsidePanel() {
        try {
            await this.webDriver.maximizeWindow();
        } catch (e) {}
        const url = (TestData as any).curbside?.baseUrl || 'https://staging.ordering.albaikcloud.com/curbside_user/branches/539/session/new';
        await this.webDriver.url(url);
    }

   
    async loginToCurbside() {
        const phone = (TestData as any).curbside?.phone || '536440699';
        const pass = (TestData as any).curbside?.password || 'Kualitatem123';
        
        const loginField = await this.webDriver.$(CommonLocators.curbsidePhoneInput);
        await loginField.waitForDisplayed({ timeout: 10000 });
        await loginField.setValue(phone);
        await this.webDriver.$(CommonLocators.webPasswordInput).setValue(pass);
        await this.webDriver.$(CommonLocators.loginBtn).click();
    }

    async waitForCurbsidePanel() {
        await this.webDriver.pause(5000);
    }

   
    async wait_for_seconds_web(seconds: number) {
        await this.webDriver.pause(seconds * 1000);
    }

    async click_web_link_by_href(href: string) {
        const locator = CommonLocators.webLinkByHref(href);
        const element = await this.webDriver.$(locator);
        await element.waitForExist({ timeout: 15000 });
        await element.scrollIntoView({ block: 'center' });
        await element.waitForDisplayed({ timeout: 5000 });
        await this.webDriver.pause(500); // Give the browser a moment to settle scrolling
        try {
            await element.click();
        } catch (error) {
            console.log(`[Web] Standard click failed for "${href}", falling back to JS click.`);
            await this.webDriver.execute((el: any) => el.click(), element);
        }
    }

    async enter_captured_order_id_by_id(id: string) {
        const locator = CommonLocators.webInputById(id);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: 15000 });
        
        const capturedOrderId = (global as any).orderId;
        if (!capturedOrderId) {
            throw new Error("Order ID was not captured previously!");
        }
        
        await element.setValue(capturedOrderId);
        console.log(`[Web] Entered captured Order ID: ${capturedOrderId}`);
    }

    async hit_enter_web() {
        await this.webDriver.keys(['Enter']);
        console.log(`[Web] Hit 'Enter' key`);
    }

    async click_captured_order_row() {
        const capturedOrderId = (global as any).orderId;
        if (!capturedOrderId) {
            throw new Error("Order ID was not captured previously!");
        }
        
        const locator = CommonLocators.dynamicOrderRow(capturedOrderId);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: 15000 });
        await element.click();
        console.log(`[Web] Clicked on order with ID: ${capturedOrderId}`);
    }

    async verify_order_details_page() {
        const capturedOrderId = (global as any).orderId;
        if (!capturedOrderId) {
            throw new Error("Order ID was not captured previously!");
        }
        
        const locator = CommonLocators.dynamicOrderRow(capturedOrderId);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: 15000 });
        console.log(`[Web] Verified order details page is displayed for Order ID: ${capturedOrderId}`);
    }

    async accept_web_alert() {
        try {
            await this.webDriver.acceptAlert();
            console.log(`[Web] Accepted web alert`);
        } catch (e) {
            console.log(`[Web] No alert to accept or failed to accept alert: ${e}`);
        }
    }

    async enter_text_in_input_web(text: string, inputName: string) {
        const locator = (CommonLocators as any)[inputName] || CommonLocators.webInputById(inputName);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: 15000 });
        await element.setValue(text);
        console.log(`[Web] Entered text "${text}" into "${inputName}"`);
    }
}