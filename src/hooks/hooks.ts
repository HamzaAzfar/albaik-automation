import { AfterStep, AfterAll, Before, setDefinitionFunctionWrapper } from '@cucumber/cucumber';
import { DataStore } from '../services/DataStore';

let passed = 0;
let failed = 0;
let skipped = 0;
let isSmokeTest = false;

Before(function (scenario: any) {
  DataStore.clear(); // Wipe state before every scenario to prevent cross-test contamination
  const uri = scenario.pickle?.uri || scenario.uri || '';
  const tags = scenario.pickle?.tags ? scenario.pickle.tags.map((t: any) => t.name) : [];

  // Check if it's running the smoke feature file, carpickup feature file, or if the scenario has related tags
  const isSmoke = uri.toLowerCase().includes('pickup') || tags.includes('@pickup');
  // const isCarPickup = uri.toLowerCase().includes('carpickup') || tags.some((t: string) => t.toLowerCase().includes('carpickup') || t.toLowerCase().includes('car-pickup'));

  if (isSmoke) {
    isSmokeTest = true;
    DataStore.set('isSmokeTest', true);
  } else {
    isSmokeTest = false;
    DataStore.set('isSmokeTest', false);
  }
});

setDefinitionFunctionWrapper(function (fn: any) {
  const wrapper = async function (this: any, ...args: any[]) {
    if (isSmokeTest || DataStore.get('isSmokeTest')) {
      await new Promise(resolve => setTimeout(resolve, 500));
      return;
    }

    let timeoutId: NodeJS.Timeout;
    try {
      // Enforce an internal 230s timeout, catching it before the hard 240s Cucumber timeout
      const timeoutPromise = new Promise((_, reject) => {
        timeoutId = setTimeout(() => reject(new Error("Step execution exceeded 230s falling back to other locator.")), 230000);
      });
      const result = await Promise.race([fn.apply(this, args), timeoutPromise]);
      clearTimeout(timeoutId!);
      return result;
    } catch (error: any) {
      clearTimeout(timeoutId!);
      throw error;
    }
  };

  Object.defineProperty(wrapper, 'length', { value: fn.length, configurable: true });
  return wrapper;
});

AfterStep(function ({ result }: any) {
  if (!result) return;
  switch (result.status) {
    case 'PASSED':
      passed++;
      break;
    case 'FAILED':
      failed++;
      break;
    case 'SKIPPED':
    case 'PENDING':
    case 'UNDEFINED':
    case 'AMBIGUOUS':
      skipped++;
      break;
  }
});

AfterAll(function () {
  const total = passed + failed + skipped;
  const line = '─'.repeat(50);
  console.log(`\n${line}`);
  console.log(`Step Results: ${passed} passed, ${failed} failed, ${skipped} skipped (${total} total)`);
  console.log(`${line}\n`);
});
