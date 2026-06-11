

import { config as dotenvConfig } from 'dotenv';

import { execSync } from 'child_process';

import fs from 'fs';

import path from 'path';

import AllureReporter from '@wdio/allure-reporter';
import cucumberJson from 'wdio-cucumberjs-json-reporter';

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
    './src/stepdefinitions/**/*.ts',
  ]
  : isCrossPlatform
    ? [
      './src/hooks/**/*.ts',
      './src/stepdefinitions/**/*.ts',
    ]
    : isWeb
      ? [
        './src/hooks/**/*.ts',
        './src/stepdefinitions/Common/CommonStepWeb.ts',
        './src/stepdefinitions/Common/**/*.ts',
        './src/stepdefinitions/web/**/*.ts',
      ]
      : [
        './src/hooks/**/*.ts',
        './src/stepdefinitions/Common/CommonStepMob.ts',
        './src/stepdefinitions/Common/**/*.ts',
        './src/stepdefinitions/mobile/**/*.ts',
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




  logLevel: 'silent',

  onPrepare: function (config, capabilities) {
    try {
      let tagExpressionStr = config.cucumberOpts?.tagExpression || '';
      if (!tagExpressionStr) {
        const tagArg = process.argv.find(arg => arg.startsWith('--cucumberOpts.tagExpression='));
        if (tagArg) {
          tagExpressionStr = tagArg.split('=')[1];
        } else {
          const tagIdx = process.argv.indexOf('--cucumberOpts.tagExpression');
          if (tagIdx !== -1 && process.argv.length > tagIdx + 1) {
            tagExpressionStr = process.argv[tagIdx + 1];
          }
        }
      }

      let expressionNode = null;
      if (tagExpressionStr) {
        try {
          const tagExprParser = require('@cucumber/tag-expressions').default;
          expressionNode = tagExprParser(tagExpressionStr);
        } catch (e) { console.log('Tag parse error', e); }
      }

      function getFeatureFiles(dir: string, fileList: string[] = []) {
        const files = fs.readdirSync(dir);
        for (const file of files) {
          const filePath = path.join(dir, file);
          if (fs.statSync(filePath).isDirectory()) {
            getFeatureFiles(filePath, fileList);
          } else if (filePath.endsWith('.feature')) {
            fileList.push(filePath);
          }
        }
        return fileList;
      }
      const featureFiles = getFeatureFiles(path.join(process.cwd(), 'src', 'features', 'Common'));
      let totalScenarios = 0;
      let totalSteps = 0;

      for (const file of featureFiles) {
        const content = fs.readFileSync(file, 'utf-8');
        const lines = content.split('\n');

        let featureTags: string[] = [];
        let currentTags: string[] = [];
        let insideExecutingScenario = !expressionNode; // If no tag filter, execute all

        for (const line of lines) {
          const trimmed = line.trim();

          if (trimmed.startsWith('@')) {
            currentTags = currentTags.concat(trimmed.split(/\s+/));
          } else if (trimmed.startsWith('Feature:')) {
            featureTags = [...currentTags];
            currentTags = [];
          } else if (trimmed.startsWith('Scenario:') || trimmed.startsWith('Scenario Outline:')) {
            const combinedTags = [...new Set([...featureTags, ...currentTags])];
            if (expressionNode) {
              insideExecutingScenario = expressionNode.evaluate(combinedTags);
            }
            if (insideExecutingScenario) {
              totalScenarios++;
            }
            currentTags = [];
          } else if (/^(Given|When|Then|And|But)\s/.test(trimmed)) {
            if (insideExecutingScenario) {
              totalSteps++;
            }
          }
        }
      }
      console.log(`\n==================================================`);
      console.log(`TEST EXECUTION PLAN`);
      if (tagExpressionStr) {
        console.log(`   Tag Filter Applied         : ${tagExpressionStr}`);
      }
      console.log(`   Total Scenarios to Execute : ${totalScenarios}`);
      console.log(`   Total Steps to Execute     : ${totalSteps}`);
      console.log(`==================================================\n`);
    } catch (error) {
      console.log('Could not count scenarios/steps at start:', error);
    }

    const allureResultsPath = path.join(process.cwd(), 'allure-results');
    const allureReportPath = path.join(process.cwd(), 'allure-report');
    const cucumberJsonPath = path.join(process.cwd(), 'cucumber-json-reports');
    const cucumberHtmlPath = path.join(process.cwd(), 'cucumber-html-reports');

    if (fs.existsSync(allureResultsPath)) {
      fs.rmSync(allureResultsPath, { recursive: true, force: true });
      console.log('🧹 Cleared old allure-results directory for the latest run.');
    }
    if (fs.existsSync(allureReportPath)) {
      fs.rmSync(allureReportPath, { recursive: true, force: true });
    }
    if (fs.existsSync(cucumberJsonPath)) {
      fs.rmSync(cucumberJsonPath, { recursive: true, force: true });
    }
    if (fs.existsSync(cucumberHtmlPath)) {
      fs.rmSync(cucumberHtmlPath, { recursive: true, force: true });
    }

    try {
      const files = fs.readdirSync(process.cwd()).filter(f => f.startsWith('test-summary-') && f.endsWith('.json'));
      for (const file of files) {
        fs.unlinkSync(path.join(process.cwd(), file));
      }
    } catch (e) { }
  },

  onComplete: function () {
    try {
      let totalScenariosPassed = 0;
      let totalScenariosFailed = 0;
      let totalStepsPassed = 0;
      let totalStepsFailed = 0;

      const files = fs.readdirSync(process.cwd()).filter(f => f.startsWith('test-summary-') && f.endsWith('.json'));
      for (const file of files) {
        try {
          const data = JSON.parse(fs.readFileSync(path.join(process.cwd(), file), 'utf8'));
          totalScenariosPassed += data.scenariosPassed || 0;
          totalScenariosFailed += data.scenariosFailed || 0;
          totalStepsPassed += data.stepsPassed || 0;
          totalStepsFailed += data.stepsFailed || 0;
          fs.unlinkSync(path.join(process.cwd(), file));
        } catch (e) { }
      }

      console.log(`\n==================================================`);
      console.log(`FINAL TEST EXECUTION SUMMARY`);
      console.log(`   Scenarios Passed : ${totalScenariosPassed}`);
      console.log(`   Scenarios Failed : ${totalScenariosFailed}`);
      console.log(`   Steps Passed     : ${totalStepsPassed}`);
      console.log(`   Steps Failed     : ${totalStepsFailed}`);
      console.log(`==================================================\n`);
    } catch (e) { }

    try {
      execSync('npx tsx scripts/generate-cucumber-report.ts', { stdio: 'inherit' });
      console.log('\n Cucumber HTML report ready → cucumber-html-reports/index.html');
      console.log('   View:  npm run report:cucumber:open\n');

      if (!process.env.CI) {
        const isWindows = process.platform === 'win32';
        const openCmd = isWindows ? 'start' : process.platform === 'darwin' ? 'open' : 'xdg-open';
        execSync(`${openCmd} cucumber-html-reports/index.html`);
      }
    } catch (e) {
      console.error('Could not generate Cucumber HTML report:', e);
    }

    // Note for Allure Backup
    console.log('ℹAllure report auto-generation is disabled (Cucumber is primary).');
    console.log('   To generate Allure manually as a backup, run: npm run allure:report\n');
  },

  bail: 0,

  waitforTimeout: 30000,




  connectionRetryTimeout: 120000,



  connectionRetryCount: parseInt(process.env.CONNECTION_RETRY_COUNT || '3', 10),



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

    ['cucumberjs-json', {
      jsonFolder: 'cucumber-json-reports',
      language: 'en',
    }],

  ],

  beforeScenario: function (world, context) {
    console.log(`\n▶ Scenario: ${world.pickle.name}`);
  },


  afterStep: async function (step, scenario, result, context) {
    const summaryFile = path.join(process.cwd(), `test-summary-${process.pid}.json`);
    let summary = { scenariosPassed: 0, scenariosFailed: 0, stepsPassed: 0, stepsFailed: 0 };
    if (fs.existsSync(summaryFile)) {
      try { summary = JSON.parse(fs.readFileSync(summaryFile, 'utf8')); } catch (e) { }
    }
    if (result.passed) {
      summary.stepsPassed++;
      console.log(`   \x1b[32m✔\x1b[0m ${step.text}`);
    } else {
      summary.stepsFailed++;
      console.log(`   \x1b[31m✖\x1b[0m ${step.text} \x1b[31m(FAILED)\x1b[0m`);
    }
    fs.writeFileSync(summaryFile, JSON.stringify(summary));

    if (!result.passed) {
      try {
        const screenshot = await browser.takeScreenshot();
        if (typeof screenshot === 'string') {
          // Pass the base64 string directly to cucumber JSON
          cucumberJson.attach(screenshot, 'image/png');
        } else if (screenshot && typeof screenshot === 'object') {
          for (const base64Data of Object.values(screenshot)) {
            cucumberJson.attach(base64Data as string, 'image/png');
          }
        }
      } catch (error) {
        console.error('Failed to capture Cucumber screenshot:', error);
      }
    }
  },

  afterScenario: async function (_world, result) {
    const summaryFile = path.join(process.cwd(), `test-summary-${process.pid}.json`);
    let summary = { scenariosPassed: 0, scenariosFailed: 0, stepsPassed: 0, stepsFailed: 0 };
    if (fs.existsSync(summaryFile)) {
      try { summary = JSON.parse(fs.readFileSync(summaryFile, 'utf8')); } catch (e) { }
    }
    if (result.passed) summary.scenariosPassed++;
    else summary.scenariosFailed++;
    fs.writeFileSync(summaryFile, JSON.stringify(summary));

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

    retry: parseInt(process.env.RETRY_COUNT || '0', 10),


  },

};
