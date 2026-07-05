import { Then, Given, When } from '../../pages/Common/CommonPageWeb';
import WebLoginPage from '../../pages/web/WebLoginPage';

When(/^navigate to the web admin panel$/, async () => {
  await WebLoginPage.NavigateToAdminPanel();
});

When(/^login to the admin panel$/, async () => {
  await WebLoginPage.LoginToAdmin();
});

When(/^navigate to the curbside web panel$/, async () => {
  await WebLoginPage.NavigateToCurbsidePanel();
});

Then(
  /^login to the curbside panel with phone "([^"]*)" and password "([^"]*)"$/,
  async (phone: string, pass: string) => {
    await WebLoginPage.LoginToCurbside(phone, pass);
  },
);
