import { MobileLocators } from '../Mobile/MobileLocator';
import { WebLocators } from '../Web/WebLocator';
import { DriverLocators } from '../Driver/DriverLocator';

export const CommonLocators = {
  ...MobileLocators,
  ...WebLocators,
  ...DriverLocators,
};
