const reporter = require('cucumber-html-reporter');

const options = {
    theme: 'bootstrap', // 'bootstrap' theme includes the pie charts and graphs
    jsonDir: 'cucumber-json-reports',
    output: 'cucumber-html-reports/index.html',
    reportSuiteAsScenarios: true,
    scenarioTimestamp: true,
    launchReport: false,
    metadata: {
        "App Version":"1.0.0",
        "Test Environment": "STAGING",
        "Browser": "Chrome",
        "Platform": "macOS",
        "Parallel": "Scenarios",
        "Executed": "Local"
    }
};

reporter.generate(options);
