@ScanToOrder
Feature: Scan to Order - Cross-Platform End-to-End Test

  @scan
  Scenario: Place scan to order and verify in admin panel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    And I redirect to branch "539" to bypass QR scan
    Then Verify that the "Start" text is displayed
    Then Click on "Start" button
    Then Scroll "down" until "Falafel Meal" text is displayed
    Then Click on "Falafel Meal" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-instore"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Click on web Button with "KTM Test Branch"
    Then Click on web Button with "Restaurant dashboard"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Verify that the order details page is displayed with correct order ID
    Then Click on web Button with "KTM Test Branch"
    Then Click on web Button with "Restaurant dashboard"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"

  @Regression @TC_Regression_Scan_Order_001 @Monday
  Scenario: Verify that the "Scan to Order" radio button is clickable.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Scan to Order" text is displayed
    Then Click on "Scan to Order" button
    Then Verify that the "Open Camera" text is displayed

  @Regression @TC_Regression_Scan_Order_002 @Monday
  Scenario: Verify that the "Open Camera" button should be visible to the user upon tapping on the "Scan to Order" radio button.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Scan to Order" text is displayed
    Then Click on "Scan to Order" button
    Then Verify that the "Open Camera" text is displayed
    Then Click on "Open Camera" button
    Then Verify that the "Scan QR code" text is displayed


  @Regression @TC_Regression_Scan_Order_003 @Monday
  Scenario: Verify that tapping the 'Open Camera' button launches the phone's camera and allows the user to scan a QR code.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Scan to Order" text is displayed
    Then Click on "Scan to Order" button
    Then Verify that the "Open Camera" text is displayed
    Then Click on "Open Camera" button
    Then Verify that the "Scan QR code" text is displayed
    And I redirect to branch "539" to bypass QR scan
    Then Verify that the "Start" text is displayed
    Then Click on "Start" button
    Then Verify that the "Self" text is displayed

  @Regression @TC_Regression_Scan_Order_004 @Monday
  Scenario: Verify that the "X" close icon on the "Order Options" is functional.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Scan to Order" text is displayed
    Then Click on "Scan to Order" button
    Then Verify that the "Open Camera" text is displayed
    Then Click on "cross" button
    Then Verify that the "MY LIST" text is displayed

  @Regression @TC_Regression_Scan_Order_005 @Monday
  Scenario: Verify that the user is able to scan the QR code and is redirected to the relevant screen.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Scan to Order" text is displayed
    Then Click on "Scan to Order" button
    Then Verify that the "Open Camera" text is displayed
    Then Click on "Open Camera" button
    Then Verify that the "Scan QR code" text is displayed
    And I redirect to branch "539" to bypass QR scan
    Then Verify that the "Start" text is displayed
    Then Click on "Start" button
    Then Verify that the "Self" text is displayed
    Then Scroll "down" until "Falafel Meal" text is displayed
    Then Click on "Falafel Meal" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Falafel Meal" text is displayed

  @Regression @TC_Regression_Scan_Order_006 @Monday
  Scenario: Verify that the "arrow" back icon on the "Scan QR code screen" is functional.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Scan to Order" text is displayed
    Then Click on "Scan to Order" button
    Then Verify that the "Open Camera" text is displayed
    Then Click on "Open Camera" button
    Then Verify that the "Scan QR code" text is displayed
    Then Click on "arrow" button
    Then Verify that the "MENU" text is displayed



  @Regression @TC_Regression_Scan_Order_007 @Monday
  Scenario: Verify that the "Skip for now" button is functional and the user turns to the home page upon tapping.
  Scenario: Verify that the "arrow" back icon on the "Scan QR code screen" is functional.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "MENU" text is displayed

  @Regression @TC_Regression_Scan_Order_008 @Monday
  Scenario: Verify that the "Scan to Order" radio button is clickable (confirm open camera appears).
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Scan to Order" text is displayed
    Then Click on "Scan to Order" button
    Then Verify that the "Open Camera" text is displayed
