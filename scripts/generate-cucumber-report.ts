const reporter = require('cucumber-html-reporter');
const fs = require('fs');

if (!fs.existsSync('cucumber-html-reports')) {
    fs.mkdirSync('cucumber-html-reports', { recursive: true });
}

const isCI = process.env.CI === 'true';
const testPlatform = process.env.TEST_PLATFORM || 'mobile';

let targetApp = 'Albaik Mobile App (Android)';
if (testPlatform === 'web') {
    targetApp = 'Albaik Web App (Chrome)';
} else if (testPlatform === 'cross-platform') {
    targetApp = 'Cross-Platform (Web + Mobile)';
}

const options = {
    theme: 'bootstrap', // 'bootstrap' theme includes the pie charts and graphs
    jsonDir: 'cucumber-json-reports',
    output: 'cucumber-html-reports/index.html',
    reportSuiteAsScenarios: true,
    scenarioTimestamp: true,
    launchReport: false,
    name: 'ALBAIK AUTOMATION',
    brandTitle: 'Test Execution Report',
    metadata: {
        "Project": "ALBAIK AUTOMATION",
        "Test Environment": "STAGING",
        "Target": targetApp,
        "Host Platform": isCI ? "GitHub Actions Runner (macOS)" : "Local macOS",
        "Executed": isCI ? "CI/CD Pipeline" : "Local Machine"
    }
};

reporter.generate(options);
