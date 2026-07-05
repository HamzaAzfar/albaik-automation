Feature: Delivery - Cross-Platform End-to-End Test

  @delivery
  Scenario: Place a delivery order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Delivery" button
    And Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    And Click on "KTM OFFICE" button
    And Click on "Choose this location" button
    And Click on "Choose this location" button
    And Scroll "down" until "cola" text is displayed
    And Click on "cola" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-delivery"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "KTM Test Branch"
    And Click on web Button with "Restaurant dashboard"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "Print Receipt & Start Collecting"
    And accept web alert
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    And Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    When Click on "1" button
    And Click on "Scan receipt" button
    And Click on "Enter order number" button
    And Enter captured order ID into "receipt number" Input
    And Click on "Submit" button
    And Click on "Start delivering" button
    And Click on "Delivered" button
    And Click on "Delivered" button

  @Regression @TC_Regression_Delivery_Orders_001 @RegressionTest
  Scenario: Verify that the customer can select the deliver order option.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Delivery" button
    And Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    And Click on "KTM OFFICE" button
    And Click on "Choose this location" button
    And Click on "Choose this location" button
    Then I verify text "Delivery" is displayed

  @Regression @TC_Regression_Delivery_Orders_004 @RegressionTest
  Scenario: Verify the status of the order when the status is "Out for Delivery" and "Delivered" on the admin panel.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Delivery" button
    And Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    And Click on "KTM OFFICE" button
    And Click on "Choose this location" button
    And Click on "Choose this location" button
    And Scroll "down" until "cola" text is displayed
    And Click on "cola" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-delivery"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "KTM Test Branch"
    And Click on web Button with "Restaurant dashboard"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "Print Receipt & Start Collecting"
    And accept web alert
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify that the "Packing Your Order" text is displayed
    When Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    When Click on "1" button
    And Click on "Scan receipt" button
    And Click on "Enter order number" button
    And Enter captured order ID into "receipt number" Input
    And Click on "Submit" button
    And Click on "Start delivering" button
    And navigate to the web admin panel
    And Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    Then Verify "Out for delivery" text on web
    When Click on "Delivered" button
    And Click on "Delivered" button


  @Regression @TC_Regression_Delivery_Orders_006 @RegressionTest
  Scenario: Verify the status of the order when the driver has marked order as "problem".
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Delivery" button
    And Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    And Click on "KTM OFFICE" button
    And Click on "Choose this location" button
    And Click on "Choose this location" button
    And Scroll "down" until "cola" text is displayed
    And Click on "cola" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-delivery"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "KTM Test Branch"
    And Click on web Button with "Restaurant dashboard"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "Print Receipt & Start Collecting"
    And accept web alert
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    And Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    When Click on "1" button
    And Click on "Scan receipt" button
    And Click on "Enter order number" button
    And Enter captured order ID into "receipt number" Input
    And Click on "Submit" button
    And Click on "Start delivering" button
    And Click on "Problem" button
    And Click on "Wrong address" button
    And navigate to the web admin panel
    And Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    Then Verify "Failed" text on web

  @Regression @TC_Regression_Delivery_Orders_007 @RegressionTest
  Scenario: Verify that the customer can view the order details in the order history.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Delivery" button
    And Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    And Click on "KTM OFFICE" button
    And Click on "Choose this location" button
    And Click on "Choose this location" button
    And Scroll "down" until "cola" text is displayed
    And Click on "cola" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then Verify that the "verify" text is displayed
    And wait untill "#S" text is displayed
    And Verify that the "Preparing" text is displayed
    When Capture and store order id from tracking card "tracking-delivery"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "KTM Test Branch"
    And Click on web Button with "Restaurant dashboard"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "Print Receipt & Start Collecting"
    And accept web alert
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify that the "Packing" text is displayed
    When Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    When Click on "1" button
    And Click on "Scan receipt" button
    And Click on "Enter order number" button
    And Enter captured order ID into "receipt number" Input
    And Click on "Submit" button
    And Click on "Start delivering" button
    And Click on "Delivered" button
    And Click on "Delivered" button
    Given The Albaik application is launched on physical device
    When Click on profile icon
    And Click on "Order history" button
    Then I verify text "Delivered" is displayed

  @Regression @TC_Regression_Delivery_Orders_010 @RegressionTest
  Scenario: Verify the status sync against all the platforms (consumer app, driver and admin).
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Delivery" button
    And Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    And Click on "KTM OFFICE" button
    And Click on "Choose this location" button
    And Click on "Choose this location" button
    And Scroll "down" until "cola" text is displayed
    And Click on "cola" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-delivery"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    Then Verify "Pending" text on web
    When Click on web Button with "KTM Test Branch"
    And Click on web Button with "Restaurant dashboard"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "Print Receipt & Start Collecting"
    And accept web alert
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify "Prepared" text on web
    When Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    When Click on "1" button
    And Click on "Scan receipt" button
    And Click on "Enter order number" button
    And Enter captured order ID into "receipt number" Input
    And Click on "Submit" button
    And navigate to the web admin panel
    And Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    Then Verify "Out for delivery" text on web
    When Click on "Start delivering" button
    And Click on "Delivered" button
    And Click on "Delivered" button
    And navigate to the web admin panel
    And Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    Then Verify "Delivered" text on web
    Given The Albaik application is launched on physical device
    When Click on profile icon
    And Click on "Order history" button
    Then I verify text "Delivered" is displayed
