import { Then, Given, When } from '../../pages/Common/CommonPageMob';
import LoginPage from '../../pages/mobile/LoginPage';

When('I sign out if already signed in', async () => {
  await LoginPage.SignOutIfSignedIn();
});

When('Enter {string} as password', async (password: string) => {
  const valueToEnter = process.env[password] || password;
  await LoginPage.EnterPassword(valueToEnter);
});
