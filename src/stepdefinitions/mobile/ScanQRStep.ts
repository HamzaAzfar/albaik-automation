import { When } from '../../pages/Common/CommonPageMob';
import ScanQRPage from '../../pages/mobile/ScanQRPage';

When('I redirect to branch {string} to bypass QR scan', async (branchId: string) => {
  await ScanQRPage.RedirectToBranchViaIntent(branchId);
});

When('I navigate to deep link {string} to bypass QR scan', async (deepLink: string) => {
  await ScanQRPage.RedirectToDeepLink(deepLink);
});
