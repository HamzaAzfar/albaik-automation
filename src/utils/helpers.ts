export async function hideKeyboard(): Promise<void> {

  await browser.hideKeyboard();

}

export async function launchApp(): Promise<void> {
  await browser.activateApp(process.env.APP_PACKAGE!);
}

export async function closeApp(): Promise<void> {
  await browser.terminateApp(process.env.APP_PACKAGE!);
}

export async function resetApp(): Promise<void> {
  await closeApp();
  await launchApp();
}

export async function getDeviceInfo(): Promise<{ platform: string; version: string }> {
  const caps = browser.capabilities as Record<string, unknown>;
  return {
    platform: caps['platformName'] as string,
    version: caps['appium:platformVersion'] as string,
  };
}
