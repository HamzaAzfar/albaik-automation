export const WebLocators = {
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

  DynamicTextInput: (text: string) =>
    `//android.widget.EditText[contains(@text,"${text}") or contains(@resource-id,"${text}")]`,
  TrackingCard: (resourceId: string) => `//android.view.ViewGroup[contains(@resource-id, "${resourceId}")]`,
  TrackingOrderId: (resourceId: string) =>
    `//android.view.ViewGroup[contains(@resource-id, "${resourceId}")]//android.widget.TextView[contains(@text,"#")]`,
  DynamicSearchField: (placeholder: string) => `//input[@placeholder="${placeholder}"]`,
  WebInputById: (id: string) => `//input[@id="${id}"]`,
  SystemButton: (btn_name: string) => `//android.widget.Button[contains(@resource-id, "${btn_name}")]`,
  DynamicOrderRow: (orderId: string) => `//*[contains(text(),"${orderId}")]`,

  EmailInput: '//input[@name="email" or @type="email"]',
  CurbsidePhoneInput:
    '//input[@type="tel" or contains(@name, "phone") or @id="user_phone" or @name="email" or @type="email" or @id="user_login"]',
  WebPasswordInput: '//input[@name="password" or @type="password"]',
  LoginBtn: "//input[@name='commit']",

  // Product Schedule Web Locators
  'Start Time': "//div[@class='input time optional product_schedule_starts_at']//input",
  'End Time': "//div[@class='input time optional product_schedule_ends_at']//input",
  Date: "//div[@class='input datetime optional product_schedule_publish_at']//input",
  Title: "//input[@id='product_schedule_title']",
  title: "//input[@id='product_schedule_title']",

  RefundAmount: "//input[@id='refund_amount']",
};
