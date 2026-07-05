Feature: Pickup - Cross-Platform End-to-End Test

  @pickup
  Scenario: Place a pickup order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Pickup from a restaurant" button
    And Click on "Choose a restaurant" button
    And Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    And Click on "KTM Test Branch" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    And Click on "Double Espresso" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    Then wait untill "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
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
  #   Then Click on web Button with "Prepared"


  @Regression @TC_Regression_PickupOrderFlow_001 @Wed
  Scenario: Verify branch selection functionality where user needs to pickup his/her order.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_002 @Wed
  Scenario: Verify payment flow functionality in the pickup order.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "#S" text is displayed


  @Regression @TC_Regression_PickupOrderFlow_003 @Wed
  Scenario: Verify edit button and cancel button functionality on verifying payment screen at first step of ODS.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "Edit order" text is displayed
    And Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When Click on "Edit order" button
    Then Verify that the "Confirm Edit" text is displayed
    When Click on "Confirm Edit" button
    And Scroll "down" until "cola" text is displayed
    Then Verify that the "cola" text is displayed
    When Click on "cola" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "cola" text is displayed
    And Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "Cancel order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When Click on "Cancel order" button
    Then Verify that the "Confirm cancel order" text is displayed
    When Click on "Confirm cancel order" button
    Then Verify that the "Order again" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_004 @Wed
  Scenario: Verify after successfully verifying payment, order status bar will move to preparing step.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_005 @Wed
  Scenario: Verify estimated pickup time functionality EPT.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    And Verify that the "min" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_006 @Wed
  Scenario: Verify "I Have Arrived" button functionality at step 2 of ODS.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "I have Arrived" text is displayed
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the mobile order card with captured order ID

  @Regression @TC_Regression_PickupOrderFlow_007 @Wed
  Scenario: Verify after preparing food from restaurant side, order status bar should move to "Packing order".
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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

  @Regression @TC_Regression_PickupOrderFlow_008 @Thu
  Scenario: Verify after served food from restaurant side, order status bar should move to "Received".
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify that the "Packing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Picked Up"
    Then Verify that the "Received" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_009 @Thu
  Scenario: Verify order again button functionality after completing the order.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify that the "Packing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Picked Up"
    Then Verify that the "Received" text is displayed
    And Verify that the "Order again" text is displayed
    When Click on "Order again" button
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_010 @Thu
  Scenario: Verify "Good" and "Not so Good" feedback forms functionality after completing the order.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify that the "Packing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Picked Up"
    Then Verify that the "Received" text is displayed
    And Verify that the "Good" text is displayed
    And Verify that the "Not so Good" text is displayed
    When Click on "Good" button
    Then Verify that the "Thank you" text is displayed
    When Click on "Not so Good" button
    Then Verify that the "Thank you" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_011 @Thu
  Scenario: Verify User cannot mark 'I have arrived' before the assigned estimated time.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    And Verify that the "I have Arrived" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_012 @Thu
  Scenario: Verify Order Placed and pickup time is appearing correctly against all the platforms.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    And Verify that the "min" text is displayed
    And Verify "Pickup" text on web

  @Regression @TC_Regression_PickupOrderFlow_013 @Thu
  Scenario: Verify order details sharing functionality is working fine at pickup order flow.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    Given Turn "on" Mobile location
    Then Verify that the "I have Arrived" text is displayed
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the mobile order card with captured order ID
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify that the "Packing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Picked Up"
    Then Verify that the "Received" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_014 @Thu
  Scenario: Verify that when the user selects "Pickup" option, they will see a list of restaurants with "Busy/not busy".
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_015 @Sun
  Scenario: Verify EPT from AKS is correctly displayed during pre-checkout for AKS restaurant.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    Then Verify that the "min" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_016 @Sun
  Scenario: Verify that the app must show an EPT before the 2 minutes cancelation in the verifying payment page.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    And Verify that the "min" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_017 @Sun
  Scenario: Verify that application backend must retrieve the latest EPT sent from the kitchen.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    And Verify that the "min" text is displayed

  @Regression @TC_Regression_PickupOrderFlow_018 @Sun
  Scenario: Verify that the user can complete the Pickup order till the end.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    When Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Then Verify that the "Edit order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When navigate to the web admin panel
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
    Then Verify that the "Preparing" text is displayed
    Given Turn "on" Mobile location
    Then Verify that the "I have Arrived" text is displayed
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the mobile order card with captured order ID
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    Then Verify that the "Packing" text is displayed
    When Click on the order with captured order ID
    And Click on web Button with "Picked Up"
    Then Verify that the "Received" text is displayed
