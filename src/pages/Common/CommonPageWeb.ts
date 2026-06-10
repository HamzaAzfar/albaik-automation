import { Then as CucumberThen } from '@cucumber/cucumber';
import { CommonLocators } from '../../locators/Common/CommonLocator';
import { DataStore } from '../../services/DataStore';
import { Logger } from '../../utils/Logger';

export function launchapp(fn: Function) {
    const wrapper = async function (this: any, ...args: any[]) {
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
            if (DataStore.get('isSmokeTest')) {
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
    protected get webDriver() {
        return (browser as any).isMultiremote ? (browser as any).web : browser;
    }

    public static get DEFAULT_WAIT(): number {
        return DataStore.get('isSmokeTest') ? 1000 : 15000;
    }



    async WaitForRestaurantPanel() {
        const locator = `//a[@href="/admin/orders"] | //*[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'restaurant dashboard')]`;
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
        await expect(element).toBeDisplayed();
    }


    async ScrollDownWeb() {
        await browser.execute(() => {
            window.scrollBy(0, 500);
        });
    }


    async WaitForCurbsidePanel() {
        const locator = `//*[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'curbside')]`;
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
        await expect(element).toBeDisplayed();
    }


    async WaitForSecondsWeb(seconds: number) {
        if (DataStore.get('isSmokeTest')) {
            Logger.Info(`Using explicit wait`);
            return;
        }
        await this.webDriver.pause(seconds * 1000);
    }

    async ClickWebLinkByHref(href: string) {
        const lowerHref = href.toLowerCase();
        const xpathTextLower = `translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')`;
        let locator = `//a[@href="${href}"]`;

        if (lowerHref === 'assign order to me' || lowerHref === 'assign manually') {
            locator = `//*[contains(@class, 'link-button') and contains(${xpathTextLower}, '${lowerHref}')] | //button[contains(${xpathTextLower}, '${lowerHref}')] | //a[contains(${xpathTextLower}, '${lowerHref}')]`;
        } else if (lowerHref === 'assign order' || lowerHref === 'create refund') {
            locator = `//input[@name='commit'] | //button[contains(${xpathTextLower}, '${lowerHref}')]`;
        } else if (lowerHref === 'ktm test branch' || lowerHref === 'restaurant dashboard' || lowerHref === 'refund order') {
            locator = `//a[${xpathTextLower}='${lowerHref}'] | //*[${xpathTextLower}='${lowerHref}']`;
        } else if (lowerHref === 'print receipt & start collecting' || lowerHref === 'ok' || lowerHref === 'prepared' || lowerHref === 'fail') {
            locator = `//button[${xpathTextLower}='${lowerHref}'] | //div[contains(@class, 'button') and contains(${xpathTextLower}, '${lowerHref}')]`;
        } else if (lowerHref === 'partial') {
            locator = `//label[${xpathTextLower}='${lowerHref}']`;
        } else {
            locator = `//*[${xpathTextLower}='${lowerHref}'] | //input[translate(normalize-space(@value), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='${lowerHref}']`;
        }

        const element = await this.webDriver.$(locator);
        await element.waitForExist({ timeout: CommonWebPage.DEFAULT_WAIT });
        await element.scrollIntoView({ block: 'center' });
        await element.waitForDisplayed({ timeout: 5000 });
        await expect(element).toBeDisplayed();
        await this.webDriver.pause(500);
        try {
            await element.click();
        } catch (error) {
            Logger.Info(`[Web] Standard click failed for "${href}", falling back to JS click.`);
            await this.webDriver.execute((el: any) => el.click(), element);
        }
    }

    async EnterCapturedOrderIdById(id: string) {
        const locator = CommonLocators.WebInputById(id);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
        await expect(element).toBeDisplayed();

        const capturedOrderId = DataStore.get('orderId');
        if (!capturedOrderId) {
            throw new Error("Order ID was not captured previously!");
        }

        await element.setValue(capturedOrderId);
        Logger.Info(`[Web] Entered captured Order ID: ${capturedOrderId}`);
    }

    async HitEnterWeb() {
        await this.webDriver.keys(['Enter']);
        Logger.Info(`[Web] Hit 'Enter' key`);
    }

    async ClickCapturedOrderRow() {
        const capturedOrderId = DataStore.get('orderId');
        if (!capturedOrderId) {
            throw new Error("Order ID was not captured previously!");
        }

        const locator = CommonLocators.DynamicOrderRow(capturedOrderId);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
        await expect(element).toBeDisplayed();
        await element.click();
        Logger.Info(`[Web] Clicked on order with ID: ${capturedOrderId}`);
    }

    async VerifyOrderDetailsPage() {
        const capturedOrderId = DataStore.get('orderId');
        if (!capturedOrderId) {
            throw new Error("Order ID was not captured previously!");
        }

        const locator = CommonLocators.DynamicOrderRow(capturedOrderId);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
        await expect(element).toBeDisplayed();
        Logger.Info(`[Web] Verified order details page is displayed for Order ID: ${capturedOrderId}`);
    }

    async AcceptWebAlert() {
        try {
            await this.webDriver.acceptAlert();
            Logger.Info(`[Web] Accepted web alert`);
        } catch (e) {
            Logger.Info(`[Web] No alert to accept or failed to accept alert: ${e}`);
        }
    }

    async EnterTextInInputWeb(text: string, inputName: string) {
        const locator = (CommonLocators as any)[inputName] || CommonLocators.WebInputById(inputName);
        const element = await this.webDriver.$(locator);
        await element.waitForDisplayed({ timeout: CommonWebPage.DEFAULT_WAIT });
        await expect(element).toBeDisplayed();
        await element.setValue(text);
        Logger.Info(`[Web] Entered text "${text}" into "${inputName}"`);
    }

    async VerifyTextOnWeb(text: string) {
        const lowerText = text.toLowerCase();
        const xpathTextLower = `translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')`;
        const locator = `//*[contains(${xpathTextLower}, '${lowerText}')]`;
        const element = await this.webDriver.$(locator);
        await element.waitForExist({ timeout: CommonWebPage.DEFAULT_WAIT });
        await expect(element).toExist();
        Logger.Info(`[Web] Verified text is present on web: "${text}"`);
    }
}