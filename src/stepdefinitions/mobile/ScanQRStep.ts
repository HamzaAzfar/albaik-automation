import { When } from '../../pages/Common/CommonPageMob';
import ScanQRPage from '../../pages/mobile/ScanQRPage';

When('I redirect to branch {string} to bypass QR scan', async (branchId: string) => {
  await ScanQRPage.RedirectToBranchViaIntent(branchId);
});
