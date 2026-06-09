export const CommonLocators = {
  // Mobile Locators
  PickupOption: '//android.view.ViewGroup[@content-desc="Pickup from a restaurant"]',

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
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]',
  ],

  TotalAmountText: "//android.widget.TextView[contains(@text, '﷼')]",
  BasketTotalAmount: "(//android.widget.TextView[contains(@text, '﷼')])[last()]",
  CheckoutTotalAmount: "//android.widget.TextView[contains(@text, '﷼')]",

  NoticeCloseButton: [
    '//android.view.ViewGroup[@content-desc="Close"]',
    'android=new UiSelector().descriptionMatches("(?i).*close.*")',
    'android=new UiSelector().descriptionMatches("(?i)close")',
  ],

  // Web Locators
  AdminPanelTitle: '//h1[contains(text(), "Admin Panel")]',
  OrdersMenu: '//a[contains(text(), "Orders")]',
  DashboardMenu: '//a[contains(text(), "Dashboard")]',

  SearchOrderField: '//input[@placeholder="Search Order ID"]',
  SearchButton: '//button[contains(text(), "Search")]',
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

  ApproveButton: '//button[contains(text(), "Approve")]',
  RejectButton: '//button[contains(text(), "Reject")]',
  CloseButton: '//button[contains(text(), "Close")]',
  RefreshButton: '//button[@id="refresh"]',
  PageHeading: 'h1',
  MoreInfoLink: 'a',
  
  DynamicTextInput: (text: string) => `//android.widget.EditText[@text="${text}" or @resource-id="${text}"]`,
  TrackingCard: (resourceId: string) => `//android.view.ViewGroup[@resource-id="${resourceId}"]`,
  TrackingOrderId: (resourceId: string) => `//android.view.ViewGroup[@resource-id="${resourceId}"]//android.widget.TextView[contains(@text,"#")]`,
  DynamicSearchField: (placeholder: string) => `//input[@placeholder="${placeholder}"]`,
  WebInputById: (id: string) => `//input[@id="${id}"]`,
  SystemButton: (btn_name: string) => `//android.widget.Button[@resource-id="${btn_name}"]`,
  DynamicOrderRow: (orderId: string) => `//*[contains(text(),"${orderId}")]`,
  
  EmailInput: '//input[@name="email" or @type="email"]',
  CurbsidePhoneInput: '//input[@type="tel" or contains(@name, "phone") or @id="user_phone" or @name="email" or @type="email" or @id="user_login"]',
  WebPasswordInput: '//input[@name="password" or @type="password"]',
  PasswordInput: '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText',
  LoginBtn: "//input[@name='commit']",
  CardEndingWith: (lastFourDigits: string) => `//android.view.ViewGroup[@content-desc="ENDING, ${lastFourDigits}"]/com.horcrux.svg.SvgView/com.horcrux.svg.g/com.horcrux.svg.p`,
  ChannelPicker: '//android.view.ViewGroup[@resource-id="ChannelPicker"]/android.view.ViewGroup/com.horcrux.svg.SvgView',
  
  AndroidIdContent: [
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[4]/com.horcrux.svg.SvgView/com.horcrux.svg.g/ya1',
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[3]/com.horcrux.svg.SvgView/com.horcrux.svg.g/ya1',
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[3]/com.horcrux.svg.SvgView/com.horcrux.svg.g/Ca1',
    '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[4]/com.horcrux.svg.SvgView/com.horcrux.svg.g/Ca1'
  ],

  // Driver App Locators
  DriverPhoneNumber: '//android.widget.EditText[@content-desc="phoneNumber"]',
  DriverPassword: '//android.widget.EditText[@content-desc="password"]',
  SubmitBtn: '//android.view.ViewGroup[@content-desc="submit"]',
  NextBtn: '//android.widget.Button[@content-desc="Next"]',
  ReadSafetyGuidelines: '//android.widget.TextView[@text="I have read all the safety guidelines"]',
  StartTheRide: '//android.widget.Button[@content-desc="Start The Ride"]',
  ContinueBtn: '//android.view.ViewGroup[@content-desc="Continue"]',
  AllowForegroundPermission: '//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_foreground_only_button"]',
  JoinRestaurantQueue: '//android.widget.TextView[@text="Join restaurant queue"]',
  KtmOffice: '//android.view.ViewGroup[@content-desc="العمل, KTM OFFICE"]/android.view.View',
  ChooseThisLocation: '//android.widget.TextView[@text="Choose this location"]',
  ReceiptNumber: '//android.widget.EditText[@content-desc="receipt number"]',
  
  EditLocation: [
    '//android.view.ViewGroup[@content-desc="Home, Virtual force"]/android.view.ViewGroup[2]',
    '//android.view.ViewGroup[@content-desc="Home, Virtual force edited"]/android.view.ViewGroup[2]/com.horcrux.svg.SvgView/com.horcrux.svg.g/Ca1[1]',
    '//android.view.ViewGroup[@content-desc="Home, Virtual force"]/android.view.ViewGroup[2]/com.horcrux.svg.SvgView/com.horcrux.svg.g/Ca1[1]',
    '//android.view.ViewGroup[@content-desc="Home, Virtual force"]/android.view.ViewGroup[2]/com.horcrux.svg.SvgView/com.horcrux.svg.g/*[1]'
  ],
  VirtualForceCard: [
    '//android.view.ViewGroup[@content-desc="Home, Virtual force edited"]/android.view.View',
    '//android.widget.TextView[@text="Virtual force"]'
  ],
  SavedBuildingInfo: '//android.widget.EditText[@text="Virtual force"]',
  SaveAndContinue: '//android.widget.TextView[@text="Save and continue"]',
  DeleteSavedLocation: '//android.widget.TextView[@text="Delete saved location"]',
  SaveCardDetails: '//android.widget.TextView[@text="Save card details to check out faster everywhere Checkout.com is available"]',
  CheckoutEmail: '//android.widget.EditText[@resource-id="rm_edit_email_input"]/android.view.View[2]',
  AddButton: '//android.view.ViewGroup[@resource-id="Add button"]',
  ReduceButton: '//android.view.ViewGroup[@resource-id="Reduce button"]',
  
  EditOrder: [
    '//android.view.ViewGroup[@content-desc="Edit order"]',
    '//android.widget.TextView[@text="Edit order"]'
  ],
  CancelOrder: [
    '//android.view.ViewGroup[@content-desc="Cancel order"]',
    '//android.widget.TextView[@text="Cancel order"]'
  ],
  ConfirmEdit: [
    '//android.widget.TextView[@text="Confirm Edit"]',
    '//android.view.ViewGroup[@content-desc="Confirm Edit"]'
  ],
  ConfirmOrder: [
    '//android.view.ViewGroup[@content-desc="Confirm Order"]',
    '//android.widget.TextView[@text="Confirm Order"]'
  ],
  OtpInput: '(//android.widget.ScrollView/android.view.ViewGroup/android.widget.EditText[@text="0"])[1]',
  RefundAmount: "//input[@id='refund_amount']"
};
