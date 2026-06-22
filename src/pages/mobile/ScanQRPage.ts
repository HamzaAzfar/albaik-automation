import { CommonFunctionPage } from '../Common/CommonPageMob';
import { Logger } from '../../utils/Logger';

class ScanQRPage extends CommonFunctionPage {
  async RedirectToBranchViaIntent(branchId: string): Promise<void> {
    const deepLink = `albaik://store/${branchId}`;
    const pkg = process.env.APP_PACKAGE;
    if (!pkg) throw new Error('APP_PACKAGE not set in .env');
    const appActivity = process.env.APP_ACTIVITY || '.MainActivity';

    Logger.Info(`Initiating front-end redirection to branch ${branchId} via Deep Link: ${deepLink}`);

    try {
      Logger.Info('[DEBUG] Dismissing camera/overlay before redirection...');
      await this.browserInstance.back();
      // Explicitly wait until we are no longer in a system permission or camera context (or timeout)
      await this.browserInstance
        .waitUntil(
          async () => {
            const pkg = await this.browserInstance.getCurrentPackage();
            return pkg !== 'com.android.permissioncontroller' && pkg !== 'com.android.camera2';
          },
          { timeout: 3000 },
        )
        .catch(() => {});

      const currentActivityPackage = await this.browserInstance.getCurrentPackage();
      if (
        currentActivityPackage === 'com.android.permissioncontroller' ||
        currentActivityPackage === 'com.android.camera2'
      ) {
        await this.browserInstance.back();
        await this.browserInstance
          .waitUntil(
            async () => {
              const pkg = await this.browserInstance.getCurrentPackage();
              return pkg !== 'com.android.permissioncontroller' && pkg !== 'com.android.camera2';
            },
            { timeout: 3000 },
          )
          .catch(() => {});
      }
    } catch (e) {
      Logger.Info(
        '[DEBUG] Back navigation not required or failed to dismiss camera/overlay (might not have been open).',
      );
    }

    let deepLinkSuccessful = false;
    const componentName = `${pkg}/${appActivity}`;

    try {
      Logger.Info(`[DEBUG] Attempting to force deep link via explicit component: ${componentName}`);

      await this.browserInstance.execute('mobile: shell', {
        command: 'am start',
        args: ['-W', '-n', componentName, '-a', 'android.intent.action.VIEW', '-d', deepLink],
      });
      deepLinkSuccessful = true;
      Logger.Info(`Forced deep link sent successfully.`);
    } catch (error) {
      Logger.Warn(`Explicit component deep link failed. Error: ${(error as any).message || error}`);
      Logger.Info('Retrying with standard system-wide deep link resolve...');
      try {
        await this.browserInstance.execute('mobile: deepLink', { url: deepLink });
        deepLinkSuccessful = true;
        Logger.Info('System-wide deep link sent successfully.');
      } catch (err2) {
        Logger.Warn(`System-wide deep link failed. Error: ${(err2 as any).message || err2}`);
      }
    }

    if (!deepLinkSuccessful) {
      throw new Error(
        `Failed to send deep link intent. The OS could not resolve it. Check if APP_PACKAGE and APP_ACTIVITY are correct in .env`,
      );
    }

    // Explicit wait for the deep link to resolve and our app to come to the foreground
    await this.browserInstance
      .waitUntil(
        async () => {
          return (await this.browserInstance.getCurrentPackage()) === pkg;
        },
        { timeout: 10000, timeoutMsg: 'App did not come to foreground after deep link' },
      )
      .catch(() => {});
  }

  async RedirectToDeepLink(deepLink: string): Promise<void> {
    const pkg = process.env.APP_PACKAGE;
    if (!pkg) throw new Error('APP_PACKAGE not set in .env');
    const appActivity = process.env.APP_ACTIVITY || '.MainActivity';

    Logger.Info(`Initiating front-end redirection via Deep Link: ${deepLink}`);

    try {
      Logger.Info('[DEBUG] Dismissing camera/overlay before redirection...');
      await this.browserInstance.back();
      await this.browserInstance
        .waitUntil(
          async () => {
            const pkg = await this.browserInstance.getCurrentPackage();
            return pkg !== 'com.android.permissioncontroller' && pkg !== 'com.android.camera2';
          },
          { timeout: 3000 },
        )
        .catch(() => {});

      const currentActivityPackage = await this.browserInstance.getCurrentPackage();
      if (
        currentActivityPackage === 'com.android.permissioncontroller' ||
        currentActivityPackage === 'com.android.camera2'
      ) {
        await this.browserInstance.back();
        await this.browserInstance
          .waitUntil(
            async () => {
              const pkg = await this.browserInstance.getCurrentPackage();
              return pkg !== 'com.android.permissioncontroller' && pkg !== 'com.android.camera2';
            },
            { timeout: 3000 },
          )
          .catch(() => {});
      }
    } catch (e) {
      Logger.Info(
        '[DEBUG] Back navigation not required or failed to dismiss camera/overlay (might not have been open).',
      );
    }

    let deepLinkSuccessful = false;
    const componentName = `${pkg}/${appActivity}`;

    try {
      Logger.Info(`[DEBUG] Attempting to force deep link via explicit component: ${componentName}`);

      await this.browserInstance.execute('mobile: shell', {
        command: 'am start',
        args: ['-W', '-n', componentName, '-a', 'android.intent.action.VIEW', '-d', deepLink],
      });
      deepLinkSuccessful = true;
      Logger.Info(`Forced deep link sent successfully.`);
    } catch (error) {
      Logger.Warn(`Explicit component deep link failed. Error: ${(error as any).message || error}`);
      Logger.Info('Retrying with standard system-wide deep link resolve...');
      try {
        await this.browserInstance.execute('mobile: deepLink', { url: deepLink });
        deepLinkSuccessful = true;
        Logger.Info('System-wide deep link sent successfully.');
      } catch (err2) {
        Logger.Warn(`System-wide deep link failed. Error: ${(err2 as any).message || err2}`);
      }
    }

    if (!deepLinkSuccessful) {
      throw new Error(
        `Failed to send deep link intent. The OS could not resolve it. Check if APP_PACKAGE and APP_ACTIVITY are correct in .env`,
      );
    }

    // Explicit wait for the deep link to resolve and our app to come to the foreground
    await this.browserInstance
      .waitUntil(
        async () => {
          return (await this.browserInstance.getCurrentPackage()) === pkg;
        },
        { timeout: 10000, timeoutMsg: 'App did not come to foreground after deep link' },
      )
      .catch(() => {});
  }
}

export default new ScanQRPage();
