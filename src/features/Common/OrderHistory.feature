Feature: Order History

  @Regression @TC_Regression_OrderHistory_001
  Scenario: Verify that the user is shown a message when there have not been any orders.
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
    When Click on profile icon
    Then Verify that the "Order History" text is displayed
    When Click on "Order History" button
    Then Verify that the "You have no recent orders" text is displayed

  @Regression @TC_Regression_OrderHistory_002
  Scenario: Verify that the user cannot view the Orders history when not logged in.
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

  @Regression @TC_Regression_OrderHistory_003
  Scenario: Verify that when the user is logged in, and places an order, the record needs to be shown in the order history with all the details.
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
    And Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    And Click on profile icon
    And Click on "Order History" button
    Then Verify that the "ORDER HISTORY" text is displayed
    And Verify that the "orderHistoryItem" text is displayed

  @Regression @TC_Regression_OrderHistory_004
  Scenario: Verify that when the order is successfully placed, the details of the tile will be as per the requirement.
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
    And Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    And Click on profile icon
    And Click on "Order History" button
    Then Verify that the "orderHistoryItem" text is displayed
    When Click on the mobile order card with captured order ID
    Then Verify that the "Total" text is displayed
    And Verify that the "Date" text is displayed
    And Verify that the "Location" text is displayed

  @Regression @TC_Regression_OrderHistory_005
  Scenario: Verify that the status of each order is reflected in the tile.
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
    And Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    And Click on profile icon
    And Click on "Order History" button
    Then Verify that the "Pending" text is displayed
    When navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And Click on web Button with "Cancel"
    Then Verify "Cancelled" text on web
    Given The Albaik application is launched on physical device
    When Click on profile icon
    And Click on "Order history" button
    Then Verify that the "Cancelled" text is displayed

  @Regression @TC_Regression_OrderHistory_007
  Scenario: Verify that for successful order the detail page needs to show details for feedback and the cancelled order will redirect to Order Cancelled.
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
    And Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
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
    And Click on web Button with "Prepared"
    And Click on the order with captured order ID
    And Click on web Button with "Picked Up"
    Given The Albaik application is launched on physical device
    When Click on profile icon
    And Click on "Order history" button
    And Click on the mobile order card with captured order ID
    Then Verify that the "Good" text is displayed
    And Verify that the "Not so Good" text is displayed

  @Regression @TC_Regression_OrderHistory_008
  Scenario: Verify that for cancelled order user will be redirected to the relevant page.
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
    And Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "Cancel order" text is displayed
    And Verify that the "Cancel order" text is displayed
    When Click on "Cancel order" button
    Then Verify that the "Confirm cancel order" text is displayed
    When Click on "Confirm cancel order" button
    And Click on profile icon
    And Click on "Order history" button
    Then Verify that the "Cancelled" text is displayed
    When Click on the mobile order card with captured order ID
    Then Verify that the "Order Cancelled" text is displayed
    And Verify that the "Contact Support team" text is displayed

  @Regression @TC_Regression_OrderHistory_009
  Scenario: Verify that the user is able to view the receipt with accurate data when they view the order history.
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
    And Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    When Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    And Click on profile icon
    And Click on "Order history" button
    And Click on the mobile order card with captured order ID
    And Scroll "down" until "Your Order" text is displayed
    Then Verify that the "Your Order" text is displayed
    And Verify that the "Total" text is displayed
    And Verify that the "VAT" text is displayed
    And Verify that the "QR code" text is displayed
