

import { config as dotenvConfig } from 'dotenv';

import { execSync } from 'child_process';

import fs from 'fs';

import path from 'path';

import AllureReporter from '@wdio/allure-reporter';

import { getCapabilities } from './config/capabilities';



dotenvConfig();



process.env.ANDROID_SDK_ROOT = process.env.ANDROID_SDK_ROOT || process.env.ANDROID_HOME;



const TEST_PLATFORM = process.env.TEST_PLATFORM?.toLowerCase() || 'mobile';
const isCrossPlatform = TEST_PLATFORM === 'cross-platform';
const isDualMobile = TEST_PLATFORM === 'dual-mobile';
const isFullDelivery = TEST_PLATFORM === 'full-delivery';
const isWeb = TEST_PLATFORM === 'web';

const testSpecs = (isDualMobile || isFullDelivery)
  ? ['./src/features/Common/**/*.feature']
  : isCrossPlatform
  ? ['./src/features/Common/**/*.feature']
  : isWeb
  ? ['./src/features/Common/**/*.feature']
  : ['./src/features/Common/**/*.feature'];

const stepDefinitionFiles = (isDualMobile || isFullDelivery)
  ? [
      './src/hooks/**/*.ts',
      './src/stepdefinitions/Common/CommonStepMob.ts',
      './src/stepdefinitions/Common/CommonStepWeb.ts',
      './src/stepdefinitions/Common/**/*.ts',
    ]
  : isCrossPlatform
  ? [
      './src/hooks/**/*.ts',
      './src/stepdefinitions/Common/CommonStepMob.ts',
      './src/stepdefinitions/Common/CommonStepWeb.ts',
      './src/stepdefinitions/Common/**/*.ts',
    ]
  : isWeb
  ? [
      './src/hooks/**/*.ts',
      './src/stepdefinitions/Common/CommonStepWeb.ts',
      './src/stepdefinitions/Common/**/*.ts',
    ]
  : [
      './src/hooks/**/*.ts',
      './src/stepdefinitions/Common/CommonStepMob.ts',
    ];



function resolveAppiumPath(): string {
  const isWindows = process.platform === 'win32';
  try {
    const cmd = isWindows ? 'where.exe appium' : 'which appium';
    const result = execSync(cmd, { encoding: 'utf8' });

    return result.trim().split(/\r?\n/)[0].trim();

  } catch {

    const prefix = execSync('npm config get prefix', { encoding: 'utf8' }).trim();

    return isWindows ? path.join(prefix, 'appium.cmd') : path.join(prefix, 'bin', 'appium');

  }

}



export const config: WebdriverIO.Config = {

  runner: 'local',



  specs: testSpecs,

  suites: {
    carPickup: ['./src/features/Common/CarPickup.feature'],
    pickup: ['./src/features/Common/Pickup.feature'],
    delivery: ['./src/features/Common/Delivery.feature'],
    scanToOrder: ['./src/features/Common/ScanToOrder.feature'],
  },



   exclude: [
    // No excluded features
  ],



 maxInstances: (isCrossPlatform || isDualMobile) ? 2 : 1,



  capabilities: (isFullDelivery

    ? {

        customerApp: {

          capabilities: getCapabilities('customer'),

        },

        web: {

          capabilities: getCapabilities('web'),

        },

        driverApp: {

          capabilities: getCapabilities('driver'),

        },

      }

    : isDualMobile

    ? {

        customerApp: {

          capabilities: getCapabilities('customer'),

        },

        driverApp: {

          capabilities: getCapabilities('driver'),

        },

      }

    : isCrossPlatform

    ? {

        mobile: {

          capabilities: getCapabilities('mobile'),

        },

        web: {

          capabilities: getCapabilities('web'),

        },

      }

    : [getCapabilities(TEST_PLATFORM)]) as any,




  logLevel: 'error',

  onPrepare: function () {
    const allureResultsPath = path.join(process.cwd(), 'allure-results');
    const allureReportPath = path.join(process.cwd(), 'allure-report');

    if (fs.existsSync(allureResultsPath)) {
      fs.rmSync(allureResultsPath, { recursive: true, force: true });
      console.log('🧹 Cleared old allure-results directory for the latest run.');
    }
    if (fs.existsSync(allureReportPath)) {
      fs.rmSync(allureReportPath, { recursive: true, force: true });
    }
  },

  bail: 0,

  waitforTimeout: 30000,




  connectionRetryTimeout: 120000,



  connectionRetryCount: 3,



  services: [

    [

      'appium',

      {

        command: resolveAppiumPath(),

        args: {

          relaxedSecurity: true,

          log: './appium.log',

        },

      },

    ],

  ],



  framework: 'cucumber',



  reporters: [

    ['spec', { realtimeReporting: true }],

    [

      'allure',

      {

        outputDir: 'allure-results',

        disableWebdriverStepsReporting: true,

        disableWebdriverScreenshotsReporting: false,

        useCucumberStepReporter: true,

        addConsoleLogs: true,

      },

    ],

  ],



  afterScenario: async function (_world, result) {

    if (!result.passed) {

      try {

        const screenshot = await browser.takeScreenshot();

        if (typeof screenshot === 'string') {

          AllureReporter.addAttachment(

            'Screenshot on Failure',

            Buffer.from(screenshot, 'base64'),

            'image/png'

          );

        } else if (screenshot && typeof screenshot === 'object') {

          for (const [browserName, base64Data] of Object.entries(screenshot)) {

            AllureReporter.addAttachment(

              `Screenshot on Failure - ${browserName}`,

              Buffer.from(base64Data as string, 'base64'),

              'image/png'

            );

          }

        }

      } catch (error) {

        console.error('Failed to capture screenshot:', error);

      }

    }

  },



  cucumberOpts: {

    require: stepDefinitionFiles,

    backtrace: false,

    requireModule: [],

    dryRun: false,

    failFast: false,

    snippets: true,

    source: true,

    strict: false,

    tagExpression: '',

    timeout: 240000,

    ignoreUndefinedDefinitions: false,

    retry: parseInt(process.env.RETRY_COUNT || '1', 10),


  },

};
