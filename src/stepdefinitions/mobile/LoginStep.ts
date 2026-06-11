import { Then } from '../../pages/Common/CommonPageMob';
import LoginPage from '../../pages/mobile/LoginPage';

Then('I sign out if already signed in', async () => {
  await LoginPage.SignOutIfSignedIn();
});

Then('Enter {string} as password', async (password: string) => {
  await LoginPage.EnterPassword(password);
});
