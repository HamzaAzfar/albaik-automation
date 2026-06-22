import { remote } from 'webdriverio';
import { Logger } from '../utils/Logger';

class WebSessionManagerClass {
  private session: WebdriverIO.Browser | null = null;

  getSession(): WebdriverIO.Browser {
    if ((browser as any).isMultiremote && (browser as any).web) {
      return (browser as any).web;
    }
    if (!this.session) {
      throw new Error('Web browser session not initialized. Call "navigate to the web admin panel" step first.');
    }
    return this.session;
  }

  async initialize(): Promise<WebdriverIO.Browser> {
    if ((browser as any).isMultiremote && (browser as any).web) {
      Logger.Info('[WebSessionManager] MultiRemote web session detected, reusing it.');
      try {
        await (browser as any).web.reloadSession();
        Logger.Info('[WebSessionManager] Reloaded MultiRemote web session.');
      } catch (e) {
        Logger.Warn(`[WebSessionManager] Could not reload MultiRemote web session: ${e}`);
      }
      return (browser as any).web;
    }

    await this.terminate();

    Logger.Info('[WebSessionManager] Creating new standalone Chrome browser session...');
    this.session = await remote({
      capabilities: {
        browserName: 'chrome',
        'goog:chromeOptions': {
          args: [
            '--start-maximized',
            '--disable-dev-shm-usage',
            '--log-level=3',
            '--silent',
            '--disable-logging',
            '--window-size=1920,1080',
            ...(process.env.CI || process.env.WEB_HEADLESS === 'true' ? ['--headless=new', '--no-sandbox'] : []),
          ],
          excludeSwitches: ['enable-logging'],
        },
      } as any,
      logLevel: 'silent',
    });

    Logger.Info('[WebSessionManager] Standalone Chrome browser session created.');
    return this.session;
  }

  async terminate(): Promise<void> {
    if (this.session) {
      try {
        Logger.Info('[WebSessionManager] Terminating existing browser session...');
        await this.session.deleteSession();
        Logger.Info('[WebSessionManager] Browser session terminated.');
      } catch (e) {
        Logger.Warn(`[WebSessionManager] Failed to terminate browser session: ${e}`);
      }
      this.session = null;
    }
  }

  hasActiveSession(): boolean {
    if ((browser as any).isMultiremote && (browser as any).web) {
      return true;
    }
    return this.session !== null;
  }
}

export const WebSessionManager = new WebSessionManagerClass();
