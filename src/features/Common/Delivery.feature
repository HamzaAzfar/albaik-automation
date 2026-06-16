Feature: Delivery - Cross-Platform End-to-End Test

  @delivery
  Scenario: Place a delivery order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Delivery" button
    Then Click on "Choose an address" button
    Then Swipe "left" until "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Click on "Choose this location" button
    Then Click on "Choose this location" button
    Then Scroll "down" until "cola" text is displayed
    Then Click on "cola" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-delivery"
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
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"
    Then Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    Then Click on "1" button
    Then Click on "Scan receipt" button
    Then Click on "Enter order number" button
    Then Enter captured order ID into "receipt number" Input
    Then Click on "Submit" button
    Then Click on "Start delivering" button
    Then Click on "Delivered" button
    Then Click on "Delivered" button

  @Regression @TC_Regression_Delivery_Orders_001 @RegressionTest
  Scenario: Verify that the customer can select the deliver order option.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Delivery" button
    Then Click on "Choose an address" button
    Then Swipe "left" until "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Click on "Choose this location" button
    Then Click on "Choose this location" button
    Then I verify text "Delivery" is displayed

  @Regression @TC_Regression_Delivery_Orders_004 @RegressionTest
  Scenario: Verify the status of the order when the status is "Out for Delivery" and "Delivered" on the admin panel.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Delivery" button
    Then Click on "Choose an address" button
    Then Swipe "left" until "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Click on "Choose this location" button
    Then Click on "Choose this location" button
    Then Scroll "down" until "cola" text is displayed
    Then Click on "cola" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-delivery"
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
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"
    Then Verify that the "Packing Your Order" text is displayed
    Then Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    Then Click on "1" button
    Then Click on "Scan receipt" button
    Then Click on "Enter order number" button
    Then Enter captured order ID into "receipt number" Input
    Then Click on "Submit" button
    Then Click on "Start delivering" button
    Then navigate to the web admin panel
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Verify "Out for delivery" text on web
    Then Click on "Delivered" button
    Then Click on "Delivered" button


  @Regression @TC_Regression_Delivery_Orders_006 @RegressionTest
  Scenario: Verify the status of the order when the driver has marked order as "problem".
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Delivery" button
    Then Click on "Choose an address" button
    Then Swipe "left" until "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Click on "Choose this location" button
    Then Click on "Choose this location" button
    Then Scroll "down" until "cola" text is displayed
    Then Click on "cola" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-delivery"
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
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"
    Then Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    Then Click on "1" button
    Then Click on "Scan receipt" button
    Then Click on "Enter order number" button
    Then Enter captured order ID into "receipt number" Input
    Then Click on "Submit" button
    Then Click on "Start delivering" button
    Then Click on "Problem" button
    Then Click on "Wrong address" button
    Then navigate to the web admin panel
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Verify "Failed" text on web

  @Regression @TC_Regression_Delivery_Orders_007 @RegressionTest
  Scenario: Verify that the customer can view the order details in the order history.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Delivery" button
    Then Click on "Choose an address" button
    Then Swipe "left" until "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Click on "Choose this location" button
    Then Click on "Choose this location" button
    Then Scroll "down" until "cola" text is displayed
    Then Click on "cola" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then Verify that the "verify" text is displayed
    Then wait untill "#S" text is displayed
    Then Verify that the "Preparing" text is displayed
    Then Capture and store order id from tracking card "tracking-delivery"
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
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"
    Then Verify that the "Packing" text is displayed
    Then Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    Then Click on "1" button
    Then Click on "Scan receipt" button
    Then Click on "Enter order number" button
    Then Enter captured order ID into "receipt number" Input
    Then Click on "Submit" button
    Then Click on "Start delivering" button
    Then Click on "Delivered" button
    Then Click on "Delivered" button
    Given The Albaik application is launched on physical device
    Then Click on profile icon
    Then Click on "Order history" button
    Then I verify text "Delivered" is displayed

  @Regression @TC_Regression_Delivery_Orders_010 @RegressionTest
  Scenario: Verify the status sync against all the platforms (consumer app, driver and admin).
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Delivery" button
    Then Click on "Choose an address" button
    Then Swipe "left" until "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Click on "Choose this location" button
    Then Click on "Choose this location" button
    Then Scroll "down" until "cola" text is displayed
    Then Click on "cola" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-delivery"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Verify "Pending" text on web
    Then Click on web Button with "KTM Test Branch"
    Then Click on web Button with "Restaurant dashboard"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"
    Then Verify "Prepared" text on web
    Then Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    Then Click on "1" button
    Then Click on "Scan receipt" button
    Then Click on "Enter order number" button
    Then Enter captured order ID into "receipt number" Input
    Then Click on "Submit" button
    Then navigate to the web admin panel
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Verify "Out for delivery" text on web
    Then Click on "Start delivering" button
    Then Click on "Delivered" button
    Then Click on "Delivered" button
    Then navigate to the web admin panel
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then Verify "Delivered" text on web
    Given The Albaik application is launched on physical device
    Then Click on profile icon
    Then Click on "Order history" button
    Then I verify text "Delivered" is displayed
