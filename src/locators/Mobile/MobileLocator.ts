export const MobileLocators = {
  DynamicViewGroupByDesc: (desc: string) => `//android.view.ViewGroup[contains(@content-desc, "${desc}")]`,
  DynamicTextViewByText: (text: string) => `//android.widget.TextView[contains(@text, "${text}")]`,
  DynamicEditTextByDesc: (desc: string) => `//android.widget.EditText[contains(@content-desc, "${desc}")]`,
  DynamicEditTextByText: (text: string) => `//android.widget.EditText[contains(@text, "${text}")]`,
  DynamicButtonByDesc: (desc: string) => `//android.widget.Button[contains(@content-desc, "${desc}")]`,

  DriverStatus: '//android.widget.Button[@content-desc="Available"]',

  MyListSection: '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]',

  CloseButtonSelectors: [
    'android=new UiSelector().descriptionMatches("(?i)close")',
    'android=new UiSelector().descriptionMatches("(?i).*close.*")',
    'android=new UiSelector().textMatches("(?i)close|×|x")',
    'android=new UiSelector().className("android.widget.ImageView").descriptionMatches("(?i).*(close|dismiss|cross).*")',
  ],

  PickupScreenIndicators: [
    'android=new UiSelector().textMatches("(?i).*select.*restaurant.*")',
    'android=new UiSelector().textMatches("(?i).*nearest.*restaurant.*")',
    'android=new UiSelector().textMatches("(?i).*choose.*branch.*")',
    'android=new UiSelector().textMatches("(?i).*find.*restaurant.*")',
    'android=new UiSelector().descriptionMatches("(?i).*restaurant.*list.*")',
  ],

  ChooseRestaurantButton: 'android=new UiSelector().textMatches("(?i).*choose.*restaurant.*")',
  SearchManuallyButton: 'android=new UiSelector().textMatches("(?i).*search.*manually.*")',

  SearchFieldSelectors: [
    'android=new UiSelector().resourceIdMatches("(?i).*search.*")',
    'android=new UiSelector().className("android.widget.EditText").descriptionMatches("(?i).*search.*")',
    'android=new UiSelector().className("android.widget.EditText").textMatches("(?i).*search.*")',
  ],

  CarPickupButton: 'android=new UiSelector().textMatches("(?i).*car.*pickup.*")',
  BringItToMyCarButton: 'android=new UiSelector().textMatches("(?i).*bring.*it.*to.*my.*car.*")',
  OrderHereButton: 'android=new UiSelector().textMatches("(?i).*order.*here.*")',

  OrderConfirmationPanel: 'android=new UiSelector().textMatches("(?i).*order.*confirmed.*|.*thank.*you.*|.*success.*")',
  OrderIdText: 'android=new UiSelector().textMatches("(?i).*order.*id.*|.*#.*")',
  OrderSuccessMessage:
    'android=new UiSelector().textMatches("(?i).*order.*placed.*successfully.*|.*order.*confirmed.*")',
  OrderId: 'android=new UiSelector().className("android.widget.TextView").textMatches("[0-9]{6,}")',

  NoticePopupText: [
    '//android.view.ViewGroup[contains(@resource-id, "android:id/content")]//android.view.ViewGroup[2]',
  ],

  TotalAmountText: "//android.widget.TextView[contains(@text, '﷼')]",
  BasketTotalAmount: "(//android.widget.TextView[contains(@text, '﷼')])[last()]",
  CheckoutTotalAmount: "//android.widget.TextView[contains(@text, '﷼')]",

  NoticeCloseButton: [
    '//android.view.ViewGroup[contains(@content-desc, "Close")]',
    'android=new UiSelector().descriptionMatches("(?i).*close.*")',
    'android=new UiSelector().descriptionMatches("(?i)close")',
  ],

  PasswordInput:
    '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.EditText | //android.widget.EditText[@password="true" or contains(@text, "password") or contains(@resource-id, "password") or contains(@content-desc, "password")]',
  'First Name': '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText',
  'Last Name': '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText',
  'Email Address':
    '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.EditText',
  '5XXXXXXXX': '//android.widget.EditText[@text="5XXXXXXXX"]',

  CardEndingWith: (lastFourDigits: string) =>
    `//android.view.ViewGroup[contains(@content-desc, "ENDING, ${lastFourDigits}")]//com.horcrux.svg.SvgView`,
  ChannelPicker:
    '//android.view.ViewGroup[contains(@resource-id, "ChannelPicker")] | //*[@resource-id="ChannelPicker"] | //*[contains(@content-desc, "ChannelPicker")]',
  ScanToOrderRadioButton: [
    '//android.view.ViewGroup[./*[@text="Scan to Order"] or ./*[contains(@content-desc, "Scan to Order")]]',
    '//*[@text="Scan to Order"]/parent::android.view.ViewGroup',
    '//*[contains(@content-desc, "Scan to Order")]',
    '//*[@text="Scan to Order"]',
  ],
  cross:
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]',
  arrow: '//android.view.ViewGroup[@resource-id="back-button"]/com.horcrux.svg.SvgView/com.horcrux.svg.g/hd1',
  'Confirm Address': '//android.widget.Button[@resource-id="android:id/button1"]',
  'Building details': '//android.widget.EditText[@text="Building details"]',

  AndroidIdContent: [
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[2]',
    '(//android.view.ViewGroup[@resource-id="android:id/content"]//android.view.ViewGroup[1]//android.view.ViewGroup)[last()]',
    '//android.view.ViewGroup[@resource-id="ChannelPicker"]/../following-sibling::android.view.ViewGroup[2]',
  ],
};
