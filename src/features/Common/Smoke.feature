Feature: Smoke Tests - Cross-Platform End-to-End

  @smoke @login
  Scenario: Login to the customer app
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "android:id/content" text is displayed

  @smoke @register
  Scenario: Navigate to the Register screen
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Register" text is displayed
    Then Click on "Register" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Register" text is displayed
    Then Click on "Register" button
    Then Verify that the "532255875" text is displayed

  @smoke @resetpassword
  Scenario: Reset password via Forgot Password link
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Verify that the "Forgot your password?" text is displayed
    Then Click on "Forgot your password?" button
    Then Enter "505643585" into "5XXXXXXXX" Input
    Then Verify that the "Reset password" text is displayed
    Then Click on "Reset password" button
    Then Verify that the "Please check your SMS for resetting the password" text is displayed
    # Then wait for "300" Seconds
    Then Open the link "https://staging.ordering.albaikcloud.com/users/4896417/password/edit?token=f582a29b1f124e9c87c7646c%E2%80%A6" in mobile browser

  @smoke @delivery
  Scenario: Place a delivery order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    Then Click on "Choose an address" button
    Then wait for "5" Seconds
    Then Swipe left "2" times
    Then Verify that the "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Verify that the "Choose this location" text is displayed
    Then Click on "Choose this location" button
    Then Verify that the "Choose this location" text is displayed
    Then Click on "Choose this location" button
    Then Scroll down "2" lines
    Then Verify that the "cola" text is displayed
    Then Click on "cola" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Verify that the "Continue" text is displayed
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Verify that the "Pay with card" text is displayed
    Then Click on "Pay with card" button
    Then wait for "180" Seconds
    Then Capture and store order id from tracking card "tracking-delivery"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then wait for "5" seconds in web
    Then Click on web Button with "/admin/orders"
    Then wait for "2" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "KTM Test Branch"
    Then wait for "2" seconds in web
    Then Click on web Button with "Restaurant dashboard"
    Then wait for "5" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then wait for "2" seconds in web
    Then accept web alert
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "Prepared"
    Then Close the Albaik application on physical device
    Given The Albaik Driver application is launched on physical device
    Then wait for "5" Seconds
    Then Verify that the "1" text is displayed
    Then Click on "1" button
    Then Verify that the "Scan receipt" text is displayed
    Then Click on "Scan receipt" button
    Then Verify that the "Enter order number" text is displayed
    Then Click on "Enter order number" button
    Then Enter captured order ID into "receipt number" Input
    Then Verify that the "Submit" text is displayed
    Then Click on "Submit" button
    Then wait for "5" Seconds
    Then Verify that the "Start delivering" text is displayed
    Then Click on "Start delivering" button
    Then wait for "5" Seconds
    Then Verify that the "Delivered" text is displayed
    Then Click on "Delivered" button
    Then wait for "5" Seconds
    Then Verify that the "Delivered" text is displayed
    Then Click on "Delivered" button

  @smoke @pickup
  Scenario: Place a pickup order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    Then Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    Then Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    Then Click on "KTM Test Branch" button
    Then wait for "20" Seconds
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button
    Then Scroll down "2" lines
    Then Verify that the "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then wait for "10" Seconds
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then wait for "10" Seconds
    Then Verify that the "Continue" text is displayed
    Then Click on "Continue" button
    Then wait for "5" seconds
    Then Enter "123" into "checkoutCvv" Input
    Then Verify that the "Pay with card" text is displayed
    Then Click on "Pay with card" button
    Then wait for "180" Seconds
    Then Capture and store order id from tracking card "tracking-pickup"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then wait for "5" seconds in web
    Then Click on web Button with "/admin/orders"
    Then wait for "2" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "KTM Test Branch"
    Then wait for "2" seconds in web
    Then Click on web Button with "Restaurant dashboard"
    Then wait for "5" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then wait for "2" seconds in web
    Then accept web alert
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web

  @smoke @qr
  Scenario: Scan a QR code and verify it redirects to the correct channel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    And I redirect to branch "539" to bypass QR scan
    Then Verify that the "Start" text is displayed

  @smoke @instore
  Scenario: Complete an in-store order and verify on web admin panel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    And I redirect to branch "539" to bypass QR scan
    Then Verify that the "Start" text is displayed
    Then Verify that the "Start" text is displayed
    Then Click on "Start" button
    Then Scroll down "2" lines
    Then Verify that the "Falafel Meal" text is displayed
    Then Click on "Falafel Meal" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Verify that the "Continue" text is displayed
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Verify that the "Pay with card" text is displayed
    Then Click on "Pay with card" button
    Then wait for "180" Seconds
    Then Capture and store order id from tracking card "tracking-instore"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then wait for "5" seconds in web
    Then Click on web Button with "/admin/orders"
    Then wait for "2" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "KTM Test Branch"
    Then wait for "2" seconds in web
    Then Click on web Button with "Restaurant dashboard"
    Then wait for "5" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then wait for "2" seconds in web
    Then accept web alert
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "Prepared"

  @smoke @carpickup
  Scenario: Place a car pickup order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    Then Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    Then Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    Then Click on "KTM Test Branch" button
    Then wait for "20" Seconds
    Then Verify that the "bring it to my car" text is displayed
    Then Click on "bring it to my car" button
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button
    Then Scroll down "2" lines
    Then Verify that the "cola" text is displayed
    Then Click on "cola" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Verify that the "Choose this car" text is displayed
    Then Click on "Choose this car" button
    Then Verify that the "Continue" text is displayed
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Verify that the "Pay with card" text is displayed
    Then Click on "Pay with card" button
    Then wait for "180" Seconds
    Then Capture and store order id from tracking card "tracking-curbside"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then wait for "5" seconds in web
    Then Click on web Button with "/admin/orders"
    Then wait for "2" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "KTM Test Branch"
    Then wait for "2" seconds in web
    Then Click on web Button with "Restaurant dashboard"
    Then wait for "5" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then wait for "2" seconds in web
    Then accept web alert
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web

  @smoke @existingcard
  Scenario: Complete checkout using an existing saved card
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    Then Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    Then Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    Then Click on "KTM Test Branch" button
    Then wait for "20" Seconds
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button
    Then Scroll down "2" lines
    Then Verify that the "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then wait for "10" Seconds
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then wait for "10" Seconds
    Then Verify that the "Continue" text is displayed
    Then Click on "Continue" button
    Then wait for "5" seconds
    Then Enter "123" into "checkoutCvv" Input
    Then Verify that the "Pay with card" text is displayed
    Then Click on "Pay with card" button
    Then wait for "180" Seconds
    Then Capture and store order id from tracking card "tracking-pickup"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then wait for "5" seconds in web
    Then Click on web Button with "/admin/orders"
    Then wait for "2" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "KTM Test Branch"
    Then wait for "2" seconds in web
    Then Click on web Button with "Restaurant dashboard"
    Then wait for "5" seconds in web
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then wait for "2" seconds in web
    Then accept web alert
    Then wait for "2" seconds in web
    Then Click on the order with captured order ID
    Then wait for "2" seconds in web

  @smoke @homescreen
  Scenario: Verify home screen sections are displayed after login
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "MY LIST" text is displayed
    Then Verify that the "MENU" text is displayed

  @smoke @favorite
  Scenario: Navigate to the Favorites screen via MY LIST section
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Swipe left "3" times on "MyListSection" section
    Then wait for "2" Seconds
    Then Verify that the "View All" text is displayed
    Then Click on "View All" button
    Then wait for "5" Seconds
    Then Verify that the "Favorite" text is displayed

  @smoke @stcpay
  Scenario: Checkout Screen - STC Pay
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    Then Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    Then Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    Then Click on "KTM Test Branch" button
    Then wait for "20" Seconds
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button
    Then Scroll down "2" lines
    Then Verify that the "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then wait for "10" Seconds
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then wait for "10" Seconds
    Then Verify that the "Continue" text is displayed
    Then Click on "Continue" button
    Then wait for "5" Seconds
    Then Verify that the "Pay with STC Bank" text is displayed
    Then Click on "Pay with STC Bank" button
    Then Enter "0548220713" into "05XXXXXXXX" Input
    Then Verify that the "stcPaySubmit" text is displayed
    Then Click on "stcPaySubmit" button
    Then wait for "5" Seconds
    Then Verify that the "Begin" text is displayed
    Then Click on "Begin" button
    Then Verify that the "Let's confirm you are human" text is displayed

  @smoke @creditdebit
  Scenario: Checkout Screen - Credit/Debit Card
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Pickup from a restaurant" text is displayed
    Then Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    Then Click on "Choose a restaurant" button
    Then Verify that the "Search manually" text is displayed
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    Then Click on "KTM Test Branch" button
    Then wait for "20" Seconds
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button
    Then Scroll down "2" lines
    Then Verify that the "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then wait for "10" Seconds
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then wait for "10" Seconds
    Then Verify that the "Continue" text is displayed
    Then Click on "Continue" button
    Then wait for "5" Seconds
    Then Verify that the "Credit / Debit" text is displayed
    Then Click on "Credit / Debit" button
    Then Enter "talha yousuf" into "card_holder_name_input" Input
    Then Enter "4012 8888 8888 1881" into "card_number_input" Input
    Then Enter "11/26" into "expiry_date_input" Input
    Then Enter "123" into "cvv_input" Input
    Then Verify that the "payWithNewCard" text is displayed
    Then Click on "payWithNewCard" button

  @smoke @orderhistory
  Scenario: View order history from the profile section
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then Verify that the "Order History" text is displayed
    Then Click on "Order History" button
    Then Verify that the "ORDER HISTORY" text is displayed

  @smoke @orderdetails
  Scenario: View order details from order history
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then Verify that the "Order History" text is displayed
    Then Click on "Order History" button
    Then Verify that the "ORDER HISTORY" text is displayed
    Then Verify that the "orderHistoryItem" text is displayed
    Then Click on "orderHistoryItem" button
    Then Verify that the "Contact support team" text is displayed

  @smoke @account
  Scenario: Edit account settings - update email and gender
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then Verify that the "Account" text is displayed
    Then Click on "Account" button
    Then Verify that the "ACCOUNT SETTINGS" text is displayed
    Then Enter "test2@gmail.com" into "accountEmailField" Input
    Then Scroll down "2" lines
    Then Verify that the "Female" text is displayed
    Then Click on "Female" button
    Then Verify that the "Save" text is displayed
    Then Click on "Save" button
    Then wait for "3" Seconds
    Then Scroll down "2" lines
    Then Verify that the "Female" text is displayed

@smoke @EditLocation
  Scenario: Edit, view, delete saved location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then wait for "10" Seconds
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    Then Click on "Choose an address" button
    Then wait for "5" Seconds
    Then Swipe left "2" times
    Then Verify that the "Edit location" text is displayed
    Then Click on "Edit location" button
    Then wait for "2" Seconds
    Then Enter "Virtual force edited" into "Saved building information" Input
    Then wait for "3" Seconds
    Then Scroll down "2" lines
    Then Verify that the "Save and continue" text is displayed
    Then Click on "Save and continue" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    Then Click on "Choose an address" button
    Then wait for "5" Seconds
    Then Verify that the "Virtual force" text is displayed
    Then Verify that the "Virtual force edited" text is displayed
    Then Click on "Virtual force edited" button
    Then Verify that the "Choose this location" text is displayed
    Then Click on "Choose this location" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    Then Click on "Choose an address" button
    Then wait for "5" Seconds
    Then Verify that the "Virtual force" text is displayed
    Then Verify that the "Edit location" text is displayed
    Then Click on "Edit location" button
    Then wait for "3" Seconds
    Then Scroll down "2" lines
    Then Verify that the "Delete saved location" text is displayed
    Then Click on "Delete saved location" button
    Then Verify that the "Delete" text is displayed
    Then Click on "Delete" button

@smoke @EditOrder
  Scenario: Edit order in 2 minutes timer
   Given The Albaik application is launched on physical device
      Then Click on "android:id/button2" button
      Then Verify that the "Saudi Arabia" text is displayed
      Then Click on "Saudi Arabia" button
      Then Click on "android:id/button2" button
      Then Verify that the "Skip" text is displayed
      Then Click on "Skip" button
      Then Verify that the "android:id/content" text is displayed
      Then Click on "android:id/content" button
      Then I sign out if already signed in
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then Enter "532255875" into "5XXXXXXXX" Input
      Then Enter "11223344" as password
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then wait for "10" Seconds
      Then Verify that the "ChannelPicker" text is displayed
      Then Click on "ChannelPicker" button
      Then Verify that the "Pickup from a restaurant" text is displayed
      Then Click on "Pickup from a restaurant" button
      Then Verify that the "Choose a restaurant" text is displayed
      Then Click on "Choose a restaurant" button
      Then Verify that the "Search manually" text is displayed
      Then Click on "Search manually" button
      Then Enter "ktm" into "City, Branch" Input
      Then Hit "Enter" key
      Then wait untill "KTM Test Branch" text is displayed
      Then Verify that the "KTM Test Branch" text is displayed
      Then Click on "KTM Test Branch" button
      Then wait for "20" Seconds
      Then Verify that the "Order Here" text is displayed
      Then Click on "Order Here" button
      Then Scroll down "2" lines
      Then Verify that the "Double Espresso" text is displayed
      Then Click on "Double Espresso" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      Then Verify that the "Confirm Order" text is displayed
      Then Click on "Confirm Order" button
      Then wait for "10" Seconds
      Then Complete dynamic checkout with CVV "123"
      Then Click on "Pay" button
      Then wait for "10" Seconds
      Then Click on "Edit order" button 
      Then Click on "Confirm Edit" button
      Then wait for "5" Seconds
      Then Scroll down "2" lines
      Then Verify that the "cola" text is displayed
      Then Click on "cola" button
      Then Click on "Update order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      
@smoke @CancelOrder
  Scenario: Cancel order in 2 minutes timer
   Given The Albaik application is launched on physical device
      Then Click on "android:id/button2" button
      Then Verify that the "Saudi Arabia" text is displayed
      Then Click on "Saudi Arabia" button
      Then Click on "android:id/button2" button
      Then Verify that the "Skip" text is displayed
      Then Click on "Skip" button
      Then Verify that the "android:id/content" text is displayed
      Then Click on "android:id/content" button
      Then I sign out if already signed in
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then Enter "532255875" into "5XXXXXXXX" Input
      Then Enter "11223344" as password
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then wait for "10" Seconds
      Then Verify that the "ChannelPicker" text is displayed
      Then Click on "ChannelPicker" button
      Then Verify that the "Pickup from a restaurant" text is displayed
      Then Click on "Pickup from a restaurant" button
      Then Verify that the "Choose a restaurant" text is displayed
      Then Click on "Choose a restaurant" button
      Then Verify that the "Search manually" text is displayed
      Then Click on "Search manually" button
      Then Enter "ktm" into "City, Branch" Input
      Then Hit "Enter" key
      Then Verify that the "KTM Test Branch" text is displayed
      Then Click on "KTM Test Branch" button
      Then wait for "20" Seconds
      Then Verify that the "Order Here" text is displayed
      Then Click on "Order Here" button
      Then Scroll down "2" lines
      Then Verify that the "Double Espresso" text is displayed
      Then Click on "Double Espresso" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      Then Verify that the "Confirm Order" text is displayed
      Then Click on "Confirm Order" button
      Then wait for "10" Seconds
      Then Complete dynamic checkout with CVV "123"
      Then Verify that the "Pay" text is displayed
      Then Click on "Pay" button
      Then wait for "10" Seconds
      Then Verify that the "Cancel order" text is displayed
      Then Click on "Cancel order" button
      Then Verify that the "Confirm cancel order" text is displayed
      Then Click on "Confirm cancel order" button
      Then Verify that the "Order again" text is displayed
      Then Click on "Order again" button
      Then wait for "5" Seconds
      Then Scroll down "2" lines
      Then Verify that the "cola" text is displayed
      Then Click on "cola" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      
  @smoke @FailedOrder
  Scenario: Verify failed order
      Given The Albaik application is launched on physical device
      Then Click on "android:id/button2" button
      Then Verify that the "Saudi Arabia" text is displayed
      Then Click on "Saudi Arabia" button
      Then Click on "android:id/button2" button
      Then Verify that the "Skip" text is displayed
      Then Click on "Skip" button
      Then Verify that the "android:id/content" text is displayed
      Then Click on "android:id/content" button
      Then I sign out if already signed in
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then Enter "532255875" into "5XXXXXXXX" Input
      Then Enter "11223344" as password
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then wait for "10" Seconds
      Then Verify that the "ChannelPicker" text is displayed
      Then Click on "ChannelPicker" button
      Then Verify that the "Pickup from a restaurant" text is displayed
      Then Click on "Pickup from a restaurant" button
      Then Verify that the "Choose a restaurant" text is displayed
      Then Click on "Choose a restaurant" button
      Then Verify that the "Search manually" text is displayed
      Then Click on "Search manually" button
      Then Enter "ktm" into "City, Branch" Input
      Then Hit "Enter" key
      Then Verify that the "KTM Test Branch" text is displayed
      Then Click on "KTM Test Branch" button
      Then wait for "20" Seconds
      Then Verify that the "Order Here" text is displayed
      Then Click on "Order Here" button
      Then Scroll down "2" lines
      Then Verify that the "Double Espresso" text is displayed
      Then Click on "Double Espresso" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      Then Verify that the "Confirm Order" text is displayed
      Then Click on "Confirm Order" button
      Then wait for "10" Seconds
      Then Complete dynamic checkout with CVV "123"
      Then wait for "180" Seconds
      Then Capture and store order id from tracking card "tracking-pickup"
      Then navigate to the web admin panel
      Then login to the admin panel
      Then the restaurant panel is loaded and ready
      Then wait for "5" seconds in web
      Then Click on web Button with "/admin/orders"
      Then wait for "2" seconds in web
      Then Enter captured order ID into input field "search"
      Then Hit "Enter" key in web
      Then Click on the order with captured order ID
      Then wait for "2" seconds in web
      Then I scroll down in web
      Then Click on web Button with "Fail"
      Then wait for "10" Seconds
      Then Verify that the "Failed" text is displayed

@smoke @CreateNewCard
  Scenario: Create and save new card
      Given The Albaik application is launched on physical device
      Then Click on "android:id/button2" button
      Then Verify that the "Saudi Arabia" text is displayed
      Then Click on "Saudi Arabia" button
      Then Click on "android:id/button2" button
      Then Verify that the "Skip" text is displayed
      Then Click on "Skip" button
      Then Verify that the "android:id/content" text is displayed
      Then Click on "android:id/content" button
      Then I sign out if already signed in
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then Enter "532255875" into "5XXXXXXXX" Input
      Then Enter "11223344" as password
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then wait for "10" Seconds
      Then Verify that the "ChannelPicker" text is displayed
      Then Click on "ChannelPicker" button
      Then Verify that the "Pickup from a restaurant" text is displayed
      Then Click on "Pickup from a restaurant" button
      Then Verify that the "Choose a restaurant" text is displayed
      Then Click on "Choose a restaurant" button
      Then Verify that the "Search manually" text is displayed
      Then Click on "Search manually" button
      Then Enter "ktm" into "City, Branch" Input
      Then Hit "Enter" key
      Then Verify that the "KTM Test Branch" text is displayed
      Then Click on "KTM Test Branch" button
      Then wait for "20" Seconds
      Then Verify that the "Order Here" text is displayed
      Then Click on "Order Here" button
      Then Scroll down "2" lines
      Then Verify that the "Double Espresso" text is displayed
      Then Click on "Double Espresso" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      Then Verify that the "Confirm Order" text is displayed
      Then Click on "Confirm Order" button
      Then wait for "10" Seconds
      Then Complete dynamic checkout with CVV "123"
      Then Verify that the "Save card details" text is displayed
      Then Click on "Save card details" button
      Then Enter "testautomation@kualitatem.com" into "checkout email" Input

   @smoke @RefundOrder
  Scenario: Verify Refund order
      Given The Albaik application is launched on physical device
      Then Click on "android:id/button2" button
      Then Verify that the "Saudi Arabia" text is displayed
      Then Click on "Saudi Arabia" button
      Then Click on "android:id/button2" button
      Then Verify that the "Skip" text is displayed
      Then Click on "Skip" button
      Then Verify that the "android:id/content" text is displayed
      Then Click on "android:id/content" button
      Then I sign out if already signed in
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then Enter "532255875" into "5XXXXXXXX" Input
      Then Enter "11223344" as password
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then wait for "10" Seconds
      Then Verify that the "ChannelPicker" text is displayed
      Then Click on "ChannelPicker" button
      Then Verify that the "Pickup from a restaurant" text is displayed
      Then Click on "Pickup from a restaurant" button
      Then Verify that the "Choose a restaurant" text is displayed
      Then Click on "Choose a restaurant" button
      Then Verify that the "Search manually" text is displayed
      Then Click on "Search manually" button
      Then Enter "ktm" into "City, Branch" Input
      Then Hit "Enter" key
      Then Verify that the "KTM Test Branch" text is displayed
      Then Click on "KTM Test Branch" button
      Then wait for "20" Seconds
      Then Verify that the "Order Here" text is displayed
      Then Click on "Order Here" button
      Then Scroll down "2" lines
      Then Verify that the "Double Espresso" text is displayed
      Then Click on "Double Espresso" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      Then Verify that the "Confirm Order" text is displayed
      Then Click on "Confirm Order" button
      Then wait for "10" Seconds
      Then Complete dynamic checkout with CVV "123"
      Then Click on "pay" button
      Then wait for "180" Seconds
      Then Capture and store order id from tracking card "tracking-pickup"
      Then navigate to the web admin panel
      Then login to the admin panel
      Then the restaurant panel is loaded and ready
      Then wait for "5" seconds in web
      Then Click on web Button with "/admin/orders"
      Then wait for "2" seconds in web
      Then Enter captured order ID into input field "search"
      Then Hit "Enter" key in web
      Then Click on the order with captured order ID
      Then wait for "2" seconds in web
      Then I scroll down in web
      Then Click on web Button with "Refund order"
      Then wait for "10" Seconds
      Then Verify that the "refund" text is displayed

@smoke @OrderVariations
Scenario: Customization and variations of an order
      Given The Albaik application is launched on physical device
      Then Click on "android:id/button2" button
      Then Verify that the "Saudi Arabia" text is displayed
      Then Click on "Saudi Arabia" button
      Then Click on "android:id/button2" button
      Then Verify that the "Skip" text is displayed
      Then Click on "Skip" button
      Then Verify that the "android:id/content" text is displayed
      Then Click on "android:id/content" button
      Then I sign out if already signed in
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then Enter "532255875" into "5XXXXXXXX" Input
      Then Enter "11223344" as password
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then wait for "10" Seconds
      Then Verify that the "ChannelPicker" text is displayed
      Then Click on "ChannelPicker" button
      Then Verify that the "Pickup from a restaurant" text is displayed
      Then Click on "Pickup from a restaurant" button
      Then Verify that the "Choose a restaurant" text is displayed
      Then Click on "Choose a restaurant" button
      Then Verify that the "Search manually" text is displayed
      Then Click on "Search manually" button
      Then Enter "ktm" into "City, Branch" Input
      Then Hit "Enter" key
      Then Verify that the "KTM Test Branch" text is displayed
      Then Click on "KTM Test Branch" button
      Then wait for "10" Seconds
      Then Verify that the "Order Here" text is displayed
      Then Click on "Order Here" button
      Then wait for "5" Seconds
      Then Scroll down "1" lines
      Then Verify that the "Double Espresso" text is displayed
      Then Click on "Double Espresso" button
      Then Verify that the "Add button" text is displayed
      Then Click on "Add button" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "cola" text is displayed
      Then Click on "cola" button
      Then Verify that the "Reduce button" text is displayed
      Then Click on "Reduce button" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      Then I capture the total amount with locator "totalAmountText" and store it as "basketTotal"
      Then Verify that the "Confirm Order" text is displayed
      Then Click on "Confirm Order" button
      Then wait for "10" Seconds
      Then I capture the total amount with locator "totalAmountText" and store it as "checkoutTotal"
      Then I compare both stored amounts "basketTotal" and "checkoutTotal" and pass
      
  @smoke @GoogleLogin
  Scenario: Conntinue with google
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on "android:id/content" button
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on "Continue with Google" button
    Then wait for "5" Seconds
    Then Click on "Accept & Continue" button
    Then Click on "com.google.android.gms:id/account_display_name" button
    Then wait for "10" Seconds
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Click on "Verify Number" button
    Then wait for "5" Seconds
    Then Enter "11223344" as password
    Then Enter "0000" into "OTP" Input


@smoke @PartialRefund
  Scenario: Verify Partial Refund order
      Given The Albaik application is launched on physical device
      Then Click on "android:id/button2" button
      Then Verify that the "Saudi Arabia" text is displayed
      Then Click on "Saudi Arabia" button
      Then Click on "android:id/button2" button
      Then Verify that the "Skip" text is displayed
      Then Click on "Skip" button
      Then Verify that the "android:id/content" text is displayed
      Then Click on "android:id/content" button
      Then I sign out if already signed in
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then Enter "532255875" into "5XXXXXXXX" Input
      Then Enter "11223344" as password
      Then Verify that the "Sign In" text is displayed
      Then Click on "Sign In" button
      Then wait for "10" Seconds
      Then Verify that the "ChannelPicker" text is displayed
      Then Click on "ChannelPicker" button
      Then Verify that the "Pickup from a restaurant" text is displayed
      Then Click on "Pickup from a restaurant" button
      Then Verify that the "Choose a restaurant" text is displayed
      Then Click on "Choose a restaurant" button
      Then Verify that the "Search manually" text is displayed
      Then Click on "Search manually" button
      Then Enter "ktm" into "City, Branch" Input
      Then Hit "Enter" key
      Then Verify that the "KTM Test Branch" text is displayed
      Then Click on "KTM Test Branch" button
      Then wait for "20" Seconds
      Then Verify that the "Order Here" text is displayed
      Then Click on "Order Here" button
      Then Scroll down "2" lines
      Then Verify that the "Double Espresso" text is displayed
      Then Click on "Double Espresso" button
      Then Verify that the "Add to order" text is displayed
      Then Click on "Add to order" button
      Then Verify that the "View Basket" text is displayed
      Then Click on "View Basket" button
      Then wait for "10" Seconds
      Then Verify that the "Confirm Order" text is displayed
      Then Click on "Confirm Order" button
      Then wait for "10" Seconds
      Then Complete dynamic checkout with CVV "123"
      Then Click on "pay" button
      Then wait for "180" Seconds
      Then Capture and store order id from tracking card "tracking-pickup"
      Then navigate to the web admin panel
      Then login to the admin panel
      Then the restaurant panel is loaded and ready
      Then wait for "5" seconds in web
      Then Click on web Button with "/admin/orders"
      Then wait for "2" seconds in web
      Then Enter captured order ID into input field "search"
      Then Hit "Enter" key in web
      Then Click on the order with captured order ID
      Then wait for "2" seconds in web
      Then I scroll down in web
      Then Click on web Button with "Refund order"
      Then wait for "10" seconds in web
      Then Click on web Button with "Partial"
      Then Enter "10" into "refund_amount" Input web
      Then Click on web Button with "Create Refund"
      Then wait for "10" seconds in web
      


    

  