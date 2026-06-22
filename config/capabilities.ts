import { config as dotenvConfig } from 'dotenv';

import { mobileEnvironments } from '../src/data/mobile/environments';

dotenvConfig();

export function getCapabilities(testPlatform = process.env.TEST_PLATFORM || 'mobile') {
  const platform = testPlatform.toLowerCase();

  if (platform === 'web') {
    const browser = process.env.BROWSER?.toLowerCase() || 'chrome';

    const browserCapabilities = {
      chrome: {
        browserName: 'chrome',

        'goog:chromeOptions': {
          args: [
            '--start-maximized',

            '--disable-dev-shm-usage',

            '--log-level=3',

            '--silent',

            '--disable-logging',

            '--output=/dev/null',
            '--window-size=1920,1080',
            ...(process.env.CI || process.env.WEB_HEADLESS === 'true' ? ['--headless=new', '--no-sandbox'] : []),
          ],

          excludeSwitches: ['enable-logging'],
        },
      },

      firefox: {
        browserName: 'firefox',

        'moz:firefoxOptions': {
          args: ['--no-sandbox'],
        },
      },

      edge: {
        browserName: 'MicrosoftEdge',

        'ms:edgeOptions': {
          args: ['--start-maximized', '--disable-dev-shm-usage', '--log-level=3', '--silent', '--disable-logging'],

          excludeSwitches: ['enable-logging'],
        },
      },
    };

    return browserCapabilities[browser as keyof typeof browserCapabilities] || browserCapabilities.chrome;
  }

  // Mobile capabilities with environment support

  const env = process.env.ENV?.toLowerCase() || 'staging';

  const mobileEnv = mobileEnvironments[env as keyof typeof mobileEnvironments];

  if (platform === 'customer') {
    return {
      platformName: 'Android',

      'appium:udid': process.env.CUSTOMER_UDID || 'emulator-5554',

      'appium:deviceName': process.env.CUSTOMER_UDID || 'emulator-5554',

      'appium:automationName': 'UiAutomator2',

      'appium:appPackage': mobileEnv.appPackage || process.env.APP_PACKAGE || '',

      'appium:appActivity': mobileEnv.appActivity || process.env.APP_ACTIVITY || '',

      'appium:noReset': false,

      'appium:fullReset': false,

      'appium:newCommandTimeout': 1800,

      'appium:autoGrantPermissions': true,

      ...(process.env.AVD_NAME
        ? { 'appium:avd': process.env.AVD_NAME, 'appium:avdLaunchTimeout': 180000, 'appium:avdReadyTimeout': 180000 }
        : {}),
      ...(process.env.CI || process.env.MOBILE_HEADLESS === 'true' ? { 'appium:isHeadless': true } : {}),
    };
  }

  if (platform === 'driver') {
    return {
      platformName: 'Android',

      'appium:udid': process.env.DRIVER_UDID || process.env.UDID || '',

      'appium:deviceName': process.env.DRIVER_UDID || '',

      'appium:automationName': 'UiAutomator2',

      'appium:appPackage': process.env.DRIVER_APP_PACKAGE || 'com.albaikdriver',

      'appium:appActivity': process.env.DRIVER_APP_ACTIVITY || '',

      'appium:noReset': false,

      'appium:fullReset': false,

      'appium:newCommandTimeout': 1800,

      'appium:autoGrantPermissions': true,

      ...(process.env.AVD_NAME
        ? { 'appium:avd': process.env.AVD_NAME, 'appium:avdLaunchTimeout': 180000, 'appium:avdReadyTimeout': 180000 }
        : {}),
      ...(process.env.CI || process.env.MOBILE_HEADLESS === 'true' ? { 'appium:isHeadless': true } : {}),
    };
  }

  return {
    platformName: 'Android',

    'appium:deviceName': process.env.DEVICE_NAME || 'emulator-5554',

    'appium:platformVersion': process.env.PLATFORM_VERSION || '',

    'appium:automationName': 'UiAutomator2',

    'appium:app': mobileEnv.appPath || process.env.APP_PATH || '',

    'appium:appPackage': mobileEnv.appPackage || process.env.APP_PACKAGE || '',

    'appium:appActivity': mobileEnv.appActivity || process.env.APP_ACTIVITY || '',

    'appium:noReset': false,

    'appium:fullReset': false,

    'appium:newCommandTimeout': 1800,

    'appium:autoGrantPermissions': true,

    ...(process.env.UDID && !process.env.AVD_NAME ? { 'appium:udid': process.env.UDID } : {}),
    ...(process.env.AVD_NAME
      ? { 'appium:avd': process.env.AVD_NAME, 'appium:avdLaunchTimeout': 180000, 'appium:avdReadyTimeout': 180000 }
      : {}),
    ...(process.env.CI || process.env.MOBILE_HEADLESS === 'true' ? { 'appium:isHeadless': true } : {}),
  };
}
