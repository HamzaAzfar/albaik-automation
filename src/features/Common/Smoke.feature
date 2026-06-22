@SmokeTest
Feature: Smoke Tests - Cross-Platform End-to-End


  @smoke @register1
  Scenario: Navigate to the Register screen
    Then Turn "on" Mobile location
    Then navigate to the web admin panel
    Then login to the admin panel
    Then "disable" flag of "enableQuickRegister" in admin panel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Click on "Need to Register" button
    Then Enter "John" into "First Name" Input
    Then Enter "Doe" into "Last Name" Input
    Then Enter "532255876" into "5XXXXXXXX" Input
    Then Enter "test@example.com" into "Email Address" Input
    Then Enter "Password123" as password
    Then Click on "Register" button
    Then Type "0000" on keyboard
    Then Verify that the "Successful Registration" text is displayed

  @smoke @login
  Scenario: Login to the customer app
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Sign Out" text is displayed

  @smoke @resetpassword
  Scenario: Reset password via Forgot Password link
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Verify that the "Forgot your password?" text is displayed
    Then Click on "Forgot your password?" button
    Then Enter "505643585" into "5XXXXXXXX" Input
    Then Verify that the "Reset password" text is displayed
    Then Click on "Reset password" button
    Then Verify that the "Please check your SMS for resetting the password" text is displayed
    Then Open the link "https://staging.ordering.albaikcloud.com/users/4896417/password/edit?token=f582a29b1f124e9c87c7646c%E2%80%A6" in mobile browser
    Then Verify that the "Password Reset Successfully" text is displayed

  @smoke @delivery12
  Scenario: Place a delivery order on mobile and verify on web admin panel
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    Then Click on "Choose an address" button
    Then Swipe "left" until "KTM OFFICE" text is displayed
    Then Verify that the "KTM OFFICE" text is displayed
    Then Click on "KTM OFFICE" button
    Then Verify that the "Choose this location" text is displayed
    Then Click on "Choose this location" button until it disappears
    Then Scroll "down" until "cola" text is displayed
    Then Click on "cola" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    Then Click on "Pay" button
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
    Then Verify that the "1" text is displayed
    Then Click on "1" button
    Then Verify that the "Scan receipt" text is displayed
    Then Click on "Scan receipt" button
    Then Verify that the "Enter order number" text is displayed
    Then Click on "Enter order number" button
    Then Enter captured order ID into "receipt number" Input
    Then Verify that the "Submit" text is displayed
    Then Click on "Submit" button
    Then Verify that the "Start delivering" text is displayed
    Then Click on "Start delivering" button
    Then Verify that the "Delivered" text is displayed
    Then Click on "Delivered" button
    Then Verify that the "Delivered" text is displayed
    Then Click on "Delivered" button

  @smoke @qr
  Scenario: Scan a QR code and verify it redirects to the correct channel
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    And I navigate to deep link "albaik://curbside/37" to bypass QR scan
    Then Verify any Arabic text is displayed on the screen

  @smoke @homescreen
  Scenario: Verify home screen sections are displayed after login
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Verify that the "MY LIST" text is displayed
    Then Verify that the "MENU" text is displayed

  @smoke @ProductPage
  Scenario: Verify that the product page UI and details are correct
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Scroll "down" until "Spicy Falafel Nuggets" text is displayed
    Then Click on "Spicy Falafel Nuggets" button
    Then I expect mobile element "ProductImage" to have count 1
    Then Click on "Add button" button
    Then I expect mobile element "ProductQuantity2" to have text "2"
    Then I expect mobile element "ProductNameSpicyFalafelNuggets" to have text "Spicy Falafel Nuggets"
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Scroll "down" until "ALBAIK Shawerma with Garlic Sauce" text is displayed
    Then Click on "ALBAIK Shawerma with Garlic Sauce" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then I expect mobile element "DiscountTextShawerma" to have text "Spend 20.00 ﷼ to get a discounted ALBAIK Shawerma with Garlic Sauce"
    Then Verify that the product page "Has the UI aligned"
    Then Verify that the product page "Has the price with discount"


  @smoke @favorite
  Scenario: Navigate to the Favorites screen via MY LIST section
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Swipe "left" on "MyListSection" section until "View All" text is displayed
    Then Verify that the "View All" text is displayed
    Then Click on "View All" button
    Then Verify that the "Favorite" text is displayed

  @smoke @orderhistory
  Scenario: View order history from the profile section
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Order History" text is displayed
    Then Click on "Order History" button
    Then Verify that the "ORDER HISTORY" text is displayed

  @smoke @orderdetails
  Scenario: View order details from order history
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Order History" text is displayed
    Then Click on "Order History" button
    Then Verify that the "ORDER HISTORY" text is displayed
    Then Verify that the "orderHistoryItem" text is displayed
    Then Click on "orderHistoryItem" button
    Then Verify that the "Contact support team" text is displayed

  @smoke @account
  Scenario: Edit account settings - update email and gender
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Account" text is displayed
    Then Click on "Account" button
    Then Verify that the "ACCOUNT SETTINGS" text is displayed
    Then Scroll "down" until "Female" text is displayed
    Then Verify that the "Female" text is displayed
    Then Click on "Female" button
    Then Verify that the "Save" text is displayed
    Then Click on "Save" button
    Then Verify that the "Success" text is displayed


  @smoke @EditLocation
  Scenario: Edit, view, delete saved location
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    Then Click on "Choose an address" button
    Then Swipe "left" until "New Home" text is displayed
    Then Click on "Edit" button
    Then Enter "Virtual force edited" into "New home" Input
    Then Scroll "down" until "Save and continue" text is displayed
    Then Verify that the "Save and continue" text is displayed
    Then Click on "Save and continue" button
    Then Verify that the "ChannelPicker" text is displayed
    Then Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    Then Click on "Choose an address" button
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
    Then Swipe "left" until "Virtual force" text is displayed
    Then Click on "Edit" button
    Then Scroll "down" until "Delete" text is displayed
    Then Click on "Delete" button
    Then Verify that the "Delete" text is displayed
    Then Click on "Delete" button


  @smoke @instore
  Scenario: Complete an in-store order and verify on web admin panel
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    And I redirect to branch "539" to bypass QR scan
    Then Verify that the "Start" text is displayed
    Then Click on "Start" button
    Then Scroll "down" until "Falafel Meal" text is displayed
    Then Click on "Falafel Meal" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Click on "Pay" button
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
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"

  @smoke @pickup
  Scenario: Place a pickup order on mobile and verify on web admin panel
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Click on "Pay" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-pickup"
    Then Turn "on" Mobile location
    Then Click on "I have Arrived" button
    Then Kill app and open it again
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on the mobile order card with captured order ID
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


  @smoke @carpickup
  Scenario: Place a car pickup order on mobile and verify on web admin panel
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "bring it to my car" text is displayed
    Then Click on "bring it to my car" button
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "cola" text is displayed
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
    Then Complete dynamic checkout with CVV "123"
    Then Click on "Pay" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-curbside"
    Then Turn "on" Mobile location
    Then Click on "I have Arrived" button
    Then Kill app and open it again
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on the mobile order card with captured order ID
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

  @smoke @existingcard
  Scenario: Complete checkout using an existing saved card
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
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
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-pickup"
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


  @smoke @stcpay
  Scenario: Checkout Screen - STC Pay
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Verify that the "Pay with STC Bank" text is displayed
    Then Click on "Pay with STC Bank" button
    Then Enter "0548220713" into "05XXXXXXXX" Input
    Then Verify that the "stcPaySubmit" text is displayed
    Then Click on "stcPaySubmit" button
    Then Verify that the "Begin" text is displayed
    Then Click on "Begin" button
    Then Verify that the "Let's confirm you are human" text is displayed
    Then Click on "Tick" button

  @smoke @creditdebit
  Scenario: Checkout Screen - Credit/Debit Card
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Verify that the "pay" text is displayed
    Then Click on "pay" button


  @smoke @EditOrder
  Scenario: Edit order in 2 minutes timer
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Double Espresso" text is displayed
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Click on "Pay" button
    Then wait untill "Edit order" text is displayed
    Then Click on "Edit order" button
    Then Click on "Confirm Edit" button
    Then Scroll "down" until "cola" text is displayed
    Then Verify that the "cola" text is displayed
    Then Click on "cola" button
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "cola" text is displayed

  @smoke @CancelOrder
  Scenario: Cancel order in 2 minutes timer
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Verify that the "Pay" text is displayed
    Then Click on "Pay" button
    Then Verify that the "Cancel order" text is displayed
    Then Click on "Cancel order" button
    Then Verify that the "Confirm cancel order" text is displayed
    Then Click on "Confirm cancel order" button
    Then Verify that the "Order again" text is displayed
    Then Click on "Order again" button
    Then Scroll "down" until "cola" text is displayed
    Then Verify that the "cola" text is displayed
    Then Click on "cola" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button

  @smoke @FailedOrder
  Scenario: Verify failed order
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-pickup"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then I scroll down in web
    Then Click on web Button with "Fail"
    Then Verify that the "Failed" text is displayed

  @smoke @CreateNewCard
  Scenario: Create and save new card
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Verify that the "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Verify that the "Save card details" text is displayed
    Then Click on "Save card details" button
    Then Enter "testautomation@kualitatem.com" into "checkout email" Input
    Then Enter "000" into "OTP" Input

  @smoke @RefundOrder
  Scenario: Verify Refund order
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Click on "pay" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-pickup"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then I scroll down in web
    Then Click on web Button with "Refund order"
    Then Verify that the "refund" text is displayed


  @smoke @OrderVariations
  Scenario: Customization and variations of an order
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
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
    Then I capture the total amount with locator "totalAmountText" and store it as "basketTotal"
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then I capture the total amount with locator "totalAmountText" and store it as "checkoutTotal"
    Then I compare both stored amounts "basketTotal" and "checkoutTotal" and pass

  @smoke @GoogleLogin
  Scenario: Conntinue with google
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on "Continue with Google" button
    Then Click on "Accept & Continue" button
    Then Click on "com.google.android.gms:id/account_display_name" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Click on "Verify Number" button
    Then Enter "11223344" as password
    Then Enter "0000" into "OTP" Input


  @smoke @PartialRefund
  Scenario: Verify Partial Refund order
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
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
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "Double Espresso" text is displayed
    Then Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    Then Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    Then Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    Then Click on "Confirm Order" button
    Then Complete dynamic checkout with CVV "123"
    Then Click on "pay" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-pickup"
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then I scroll down in web
    Then Click on web Button with "Refund order"
    Then Click on web Button with "Partial"
    Then Enter "10" into "refund_amount" Input web
    Then Click on web Button with "Create Refund"



