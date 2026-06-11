import { AfterStep, AfterAll, Before, setDefinitionFunctionWrapper } from '@cucumber/cucumber';
import { DataStore } from '../services/DataStore';

let passed = 0;
let failed = 0;
let skipped = 0;
let isSmokeTest = false;



setDefinitionFunctionWrapper(function (fn: any) {
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
