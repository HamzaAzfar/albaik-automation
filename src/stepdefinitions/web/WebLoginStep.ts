import { Then } from '../../pages/Common/CommonPageWeb';
import WebLoginPage from '../../pages/web/WebLoginPage';

Then(/^navigate to the web admin panel$/, async () => {
  await WebLoginPage.NavigateToAdminPanel();
});

Then(/^login to the admin panel$/, async () => {
  await WebLoginPage.LoginToAdmin();
});

Then(/^navigate to the curbside web panel$/, async () => {
  await WebLoginPage.NavigateToCurbsidePanel();
});

Then(
  /^login to the curbside panel with phone "([^"]*)" and password "([^"]*)"$/,
  async (phone: string, pass: string) => {
    await WebLoginPage.LoginToCurbside(phone, pass);
  },
);
