export const CommonLocators = {
  // Mobile Locators
  DynamicViewGroupByDesc: (desc: string) => `//android.view.ViewGroup[contains(@content-desc, "${desc}")]`,
  DynamicTextViewByText: (text: string) => `//android.widget.TextView[contains(@text, "${text}")]`,
  DynamicEditTextByDesc: (desc: string) => `//android.widget.EditText[contains(@content-desc, "${desc}")]`,
  DynamicEditTextByText: (text: string) => `//android.widget.EditText[contains(@text, "${text}")]`,
  DynamicButtonByDesc: (desc: string) => `//android.widget.Button[contains(@content-desc, "${desc}")]`,

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
  OrderSuccessMessage: 'android=new UiSelector().textMatches("(?i).*order.*placed.*successfully.*|.*order.*confirmed.*")',
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

  // Web Locators
  DynamicWebHeading: (text: string) => `//h1[contains(text(), "${text}")]`,
  DynamicWebLink: (text: string) => `//a[contains(text(), "${text}")]`,
  DynamicWebButton: (text: string) => `//button[contains(text(), "${text}")]`,

  SearchOrderField: '//input[@placeholder="Search Order ID"]',
  FilterByStatus: '//select[@id="statusFilter"]',

  OrdersTable: '//table[@class="orders-table"]',
  OrderRow: (orderId: string) => `//tr[contains(., "${orderId}")]`,
  OrderStatusCell: (orderId: string) => `//tr[contains(., "${orderId}")]//td[@class="status"]`,
  OrderServiceTypeCell: (orderId: string) => `//tr[contains(., "${orderId}")]//td[@class="serviceType"]`,
  OrderStoreCell: (orderId: string) => `//tr[contains(., "${orderId}")]//td[@class="storeName"]`,

  OrderDetailsPanel: '//div[@class="order-details-panel"]',
  OrderIdDisplay: '//span[@id="orderID"]',
  OrderStatusDisplay: '//span[@id="status"]',
  OrderTypeDisplay: '//span[@id="orderType"]',
  ServiceTypeDisplay: '//span[@id="serviceType"]',
  StoreNameDisplay: '//span[@id="storeName"]',
  OrderTimestamp: '//span[@id="timestamp"]',

  RefreshButton: '//button[@id="refresh"]',
  PageHeading: 'h1',
  MoreInfoLink: 'a',

  DynamicTextInput: (text: string) => `//android.widget.EditText[contains(@text,"${text}") or contains(@resource-id,"${text}")]`,
  TrackingCard: (resourceId: string) => `//android.view.ViewGroup[contains(@resource-id, "${resourceId}")]`,
  TrackingOrderId: (resourceId: string) => `//android.view.ViewGroup[contains(@resource-id, "${resourceId}")]//android.widget.TextView[contains(@text,"#")]`,
  DynamicSearchField: (placeholder: string) => `//input[@placeholder="${placeholder}"]`,
  WebInputById: (id: string) => `//input[@id="${id}"]`,
  SystemButton: (btn_name: string) => `//android.widget.Button[contains(@resource-id, "${btn_name}")]`,
  DynamicOrderRow: (orderId: string) => `//*[contains(text(),"${orderId}")]`,

  EmailInput: '//input[@name="email" or @type="email"]',
  CurbsidePhoneInput: '//input[@type="tel" or contains(@name, "phone") or @id="user_phone" or @name="email" or @type="email" or @id="user_login"]',
  WebPasswordInput: '//input[@name="password" or @type="password"]',
  PasswordInput: '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.EditText | //android.widget.EditText[@password="true" or contains(@text, "password") or contains(@resource-id, "password") or contains(@content-desc, "password")]',
  LoginBtn: "//input[@name='commit']",

  "First Name": '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText',
  "Last Name": '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText',
  "Email Address": '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.EditText',
  "5XXXXXXXX": '//android.widget.EditText[@text="5XXXXXXXX"]',

  CardEndingWith: (lastFourDigits: string) => `//android.view.ViewGroup[contains(@content-desc, "ENDING, ${lastFourDigits}")]//com.horcrux.svg.SvgView`,
  ChannelPicker: '//android.view.ViewGroup[contains(@resource-id, "ChannelPicker")]//com.horcrux.svg.SvgView',

  AndroidIdContent: [
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[2]',
    '(//android.view.ViewGroup[@resource-id="android:id/content"]//android.view.ViewGroup[1]//android.view.ViewGroup)[last()]',
    '//android.view.ViewGroup[@resource-id="ChannelPicker"]/../following-sibling::android.view.ViewGroup[2]',
  ],

  // Driver App Locators
  ReadSafetyGuidelines: '//android.widget.TextView[contains(@text, "safety guidelines")]',
  AllowForegroundPermission: '//android.widget.Button[contains(@resource-id, "permission_allow_foreground_only_button")]',
  JoinRestaurantQueue: '//android.widget.TextView[contains(@text, "Join restaurant queue")]',

  EditLocation: (locationName: string) => [
    `//android.view.ViewGroup[contains(@content-desc, "${locationName}")]//com.horcrux.svg.SvgView`
  ],
  SavedLocationCard: (locationName: string) => [
    `//android.view.ViewGroup[contains(@content-desc, "${locationName}")]`,
    `//android.widget.TextView[contains(@text, "${locationName}")]`
  ],
  SavedBuildingInfo: (locationName: string) => `//android.widget.EditText[contains(@text, "${locationName}")]`,
  SaveAndContinue: '//android.widget.TextView[contains(@text, "Save and continue")]',
  DeleteSavedLocation: '//android.widget.TextView[contains(@text, "Delete saved location")]',
  SaveCardDetails: '//android.widget.TextView[contains(@text, "Save card details")]',
  CheckoutEmail: '//android.widget.EditText[contains(@resource-id, "rm_edit_email_input")]',
  AddButton: '//android.view.ViewGroup[contains(@resource-id, "Add button")]',
  ReduceButton: '//android.view.ViewGroup[contains(@resource-id, "Reduce button")]',

  EditOrder: [
    '//android.view.ViewGroup[contains(@content-desc, "Edit order")]',
    '//android.widget.TextView[contains(@text, "Edit order")]'
  ],
  CancelOrder: [
    '//android.view.ViewGroup[contains(@content-desc, "Cancel order")]',
    '//android.widget.TextView[contains(@text, "Cancel order")]'
  ],
  ConfirmEdit: [
    '//android.widget.TextView[contains(@text, "Confirm Edit")]',
    '//android.view.ViewGroup[contains(@content-desc, "Confirm Edit")]'
  ],
  ConfirmOrder: [
    '//android.view.ViewGroup[contains(@content-desc, "Confirm Order")]',
    '//android.widget.TextView[contains(@text, "Confirm Order")]'
  ],
  OtpInput: '(//android.widget.EditText[contains(@text, "0")])[1]',
  RefundAmount: "//input[@id='refund_amount']"
};

