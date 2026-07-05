@SmokeTest
Feature: Smoke Tests - Cross-Platform End-to-End


  @smoke @register
  Scenario: Navigate to the Register screen
    Given Turn "on" Mobile location
    When navigate to the web admin panel
    And login to the admin panel
    Then "disable" flag of "enableQuickRegister" in admin panel
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Click on "Need to Register" button
    And Enter "John" into "First Name" Input
    And Enter "Doe" into "Last Name" Input
    And Enter "532255876" into "5XXXXXXXX" Input
    And Enter "test@example.com" into "Email Address" Input
    And Enter "Password123" as password
    And Click on "Register" button
    And Type "0000" on keyboard
    Then Verify that the "Successful Registration" text is displayed

  @smoke @login
  Scenario: Login to the customer app
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
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
    And Click on profile icon
    Then Verify that the "Sign Out" text is displayed

  @OldSmoke @resetpassword
  Scenario: Reset password via Forgot Password link
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "Forgot your password?" text is displayed
    When Click on "Forgot your password?" button
    And Enter "505643585" into "5XXXXXXXX" Input
    Then Verify that the "Reset password" text is displayed
    When Click on "Reset password" button
    Then Verify that the "Please check your SMS for resetting the password" text is displayed
    And Open the link "https://staging.ordering.albaikcloud.com/users/4896417/password/edit?token=f582a29b1f124e9c87c7646c%E2%80%A6" in mobile browser
    And Verify that the "Password Reset Successfully" text is displayed

  @smoke @delivery12
  Scenario: Place a delivery order on mobile and verify on web admin panel
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
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
    Then Verify that the "Delivery" text is displayed
    When Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    When Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    Then Verify that the "KTM OFFICE" text is displayed
    When Click on "KTM OFFICE" button
    Then Verify that the "Choose this location" text is displayed
    When Click on "Choose this location" button until it disappears
    And Scroll "down" until "cola" text is displayed
    And Click on "cola" button
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
    Then Verify that the "1" text is displayed
    When Click on "1" button
    Then Verify that the "Scan receipt" text is displayed
    When Click on "Scan receipt" button
    Then Verify that the "Enter order number" text is displayed
    When Click on "Enter order number" button
    And Enter captured order ID into "receipt number" Input
    Then Verify that the "Submit" text is displayed
    When Click on "Submit" button
    Then Verify that the "Start delivering" text is displayed
    When Click on "Start delivering" button
    Then Verify that the "Delivered" text is displayed
    When Click on "Delivered" button
    Then Verify that the "Delivered" text is displayed
    When Click on "Delivered" button

  @smoke @homescreen
  Scenario: Verify home screen sections are displayed after login
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
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
    Then Verify that the "MY LIST" text is displayed
    And Verify that the "MENU" text is displayed

  @smoke @ProductPage
  Scenario: Verify that the product page UI and details are correct
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Scroll "down" until "Spicy Falafel Nuggets" text is displayed
    And Click on "Spicy Falafel Nuggets" button
    Then I expect mobile element "ProductImage" to have count 1
    When Click on "Add button" button
    Then I expect mobile element "ProductQuantity2" to have text "2"
    And I expect mobile element "ProductNameSpicyFalafelNuggets" to have text "Spicy Falafel Nuggets"
    And Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    And Scroll "down" until "ALBAIK Shawerma with Garlic Sauce" text is displayed
    And Click on "ALBAIK Shawerma with Garlic Sauce" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    Then I expect mobile element "DiscountTextShawerma" to have text "Spend 20.00 ﷼ to get a discounted ALBAIK Shawerma with Garlic Sauce"
    And Verify that the product page "Has the UI aligned"
    And Verify that the product page "Has the price with discount"


  @OldSmoke  @favorite
  Scenario: Navigate to the Favorites screen via MY LIST section
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
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
    And Swipe "left" on "MyListSection" section until "View All" text is displayed
    Then Verify that the "View All" text is displayed
    When Click on "View All" button
    Then Verify that the "Favorite" text is displayed

  @smoke @orderhistory @orderdetails @account @EditLocation @1Jul
  Scenario: View order history, order details, edit account, and manage saved locations
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
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
    And Click on profile icon
    Then Verify that the "Order History" text is displayed
    When Click on "Order History" button
    Then Verify that the "ORDER HISTORY" text is displayed
    And Verify that the "orderHistoryItem" text is displayed
    When Click on "orderHistoryItem" button
    Then Verify that the "Contact support team" text is displayed
    When Click on "arrow" button
    And Click on "arrow" button
    And Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "ACCOUNT SETTINGS" text is displayed
    When Scroll "down" until "Female" text is displayed
    Then Verify that the "Female" text is displayed
    When Click on "Female" button
    Then Verify that the "Save" text is displayed
    When Click on "Save" button
    Then Verify that the "Success" text is displayed
    When Click on "arrow" button
    And Click on "android:id/content" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    When Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    When Click on "Choose an address" button
    And Swipe "left" until "New Home" text is displayed
    And Click on "Edit" button
    And Enter "Virtual force edited" into "New home" Input
    And Scroll "down" until "Save and continue" text is displayed
    Then Verify that the "Save and continue" text is displayed
    When Click on "Save and continue" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    When Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    When Click on "Choose an address" button
    Then Verify that the "Virtual force edited" text is displayed
    When Click on "Virtual force edited" button
    Then Verify that the "Choose this location" text is displayed
    When Click on "Choose this location" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    When Click on "Delivery" button
    Then Verify that the "Choose an address" text is displayed
    When Click on "Choose an address" button
    And Swipe "left" until "Virtual force" text is displayed
    And Click on "Edit" button
    And Scroll "down" until "Delete" text is displayed
    And Click on "Delete" button
    Then Verify that the "Delete" text is displayed
    When Click on "Delete" button


  @smoke @qr @instore @1Jul
  Scenario: Scan a QR code, redirect to channel, and complete an in-store order
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    Then Verify that the "android:id/content" text is displayed
    When Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then I navigate to deep link "albaik://curbside/37" to bypass QR scan
    And Verify any Arabic text is displayed on the screen
    When Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    Then I redirect to branch "539" to bypass QR scan
    And Verify that the "Start" text is displayed
    When Click on "Start" button
    And Scroll "down" until "Falafel Meal" text is displayed
    And Click on "Falafel Meal" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    And Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-instore"
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

  @smoke @pickup
  Scenario: Place a pickup order on mobile and verify on web admin panel
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
    And Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    And Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the mobile order card with captured order ID
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


  @smoke @carpickup
  Scenario: Place a car pickup order on mobile and verify on web admin panel
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
    Then Verify that the "bring it to my car" text is displayed
    When Click on "bring it to my car" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "cola" text is displayed
    Then Verify that the "cola" text is displayed
    When Click on "cola" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    Then Verify that the "Choose this car" text is displayed
    When Click on "Choose this car" button
    And Complete dynamic checkout with CVV "123"
    And Click on "Pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-curbside"
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the mobile order card with captured order ID
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

  @smoke @CreateNewCard @existingcard @1Jul
  Scenario: Create and save new card and complete checkout using an existing saved card
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
    Then Verify that the "Save card details" text is displayed
    When Click on "Save card details" button
    And Enter "testautomation@kualitatem.com" into "checkout email" Input
    And Enter "000" into "OTP" Input
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
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
    Then Verify that the "Continue" text is displayed
    When Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    Then Verify that the "Pay with card" text is displayed
    When Click on "Pay with card" button
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


  @smoke @stcpay
  Scenario: Checkout Screen - STC Pay
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
    And Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    Then Verify that the "Pay with STC Bank" text is displayed
    When Click on "Pay with STC Bank" button
    And Enter "0548220713" into "05XXXXXXXX" Input
    Then Verify that the "stcPaySubmit" text is displayed
    When Click on "stcPaySubmit" button
    Then Verify that the "Begin" text is displayed
    When Click on "Begin" button
    Then Verify that the "Let's confirm you are human" text is displayed
    When Click on "Tick" button

  @smoke @creditdebit
  Scenario: Checkout Screen - Credit/Debit Card
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
    And Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then Verify that the "pay" text is displayed
    When Click on "pay" button


  @smoke @EditOrder
  Scenario: Edit order in 2 minutes timer
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
    Then wait untill "KTM Test Branch" text is displayed
    And Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    And Scroll "down" until "Double Espresso" text is displayed
    And Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Double Espresso" text is displayed
    And Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    And Click on "Pay" button
    Then wait untill "Edit order" text is displayed
    When Click on "Edit order" button
    And Click on "Confirm Edit" button
    And Scroll "down" until "cola" text is displayed
    Then Verify that the "cola" text is displayed
    When Click on "cola" button
    And Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "cola" text is displayed

  @smoke @CancelOrder
  Scenario: Cancel order in 2 minutes timer
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
    Then Verify that the "Cancel order" text is displayed
    When Click on "Cancel order" button
    Then Verify that the "Confirm cancel order" text is displayed
    When Click on "Confirm cancel order" button
    Then Verify that the "Order again" text is displayed
    When Click on "Order again" button
    And Scroll "down" until "cola" text is displayed
    Then Verify that the "cola" text is displayed
    When Click on "cola" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button

  @smoke @FailedOrder
  Scenario: Verify failed order
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
    And Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And I scroll down in web
    And Click on web Button with "Fail"
    Then Verify that the "Failed" text is displayed



  @smoke @RefundOrder
  Scenario: Verify Refund order
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
    And Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    And Click on "pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And I scroll down in web
    And Click on web Button with "Refund order"
    Then Verify that the "refund" text is displayed


  @smoke @OrderVariations
  Scenario: Customization and variations of an order
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
    Then Verify that the "Add button" text is displayed
    When Click on "Add button" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "cola" text is displayed
    When Click on "cola" button
    Then Verify that the "Reduce button" text is displayed
    When Click on "Reduce button" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    And I capture the total amount with locator "totalAmountText" and store it as "basketTotal"
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And I capture the total amount with locator "totalAmountText" and store it as "checkoutTotal"
    Then I compare both stored amounts "basketTotal" and "checkoutTotal" and pass

  @smoke @GoogleLogin @1Jul
  Scenario: Conntinue with google
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
    And Click on "Continue with Google" button
    And Click on "Accept & Continue" button
    And Click on "com.google.android.gms:id/account_display_name" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Click on "Verify Number" button
    And Enter "MOBILE_PASSWORD" as password
    And Enter "0000" into "OTP" Input


  @smoke @PartialRefund
  Scenario: Verify Partial Refund order
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
    And Click on "Double Espresso" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button
    Then Verify that the "View Basket" text is displayed
    When Click on "View Basket" button
    Then Verify that the "Confirm Order" text is displayed
    When Click on "Confirm Order" button
    And Complete dynamic checkout with CVV "123"
    And Click on "pay" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-pickup"
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And I scroll down in web
    And Click on web Button with "Refund order"
    And Click on web Button with "Partial"
    And Enter "10" into "refund_amount" Input we
    And Click on web Button with "Create Refund"

  @smoke @LocationAndRestaurantSelection @1Jul
  Scenario: Verify Location & Restaurant Selection
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
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    Then Verify that the "Delivery" text is displayed
    And Verify that the "Pickup from a restaurant" text is displayed
    And Verify that the "bring it to my car" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Choose a restaurant" text is displayed
    When Click on "Choose a restaurant" button
    Then Verify that the "Map" text is displayed
    When Click on "Map" button
    Then Verify that the "Nearest" text is displayed
    And Verify that the "Zoom in" text is displayed
    When Click on "Zoom in" button
    Then Verify that the "Zoom out" text is displayed
    When Click on "Zoom out" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed

  @smoke @Combos @1Jul
  Scenario: Verify that Combos are working as expected.
    When navigate to the web admin panel
    And login to the admin panel
    And Click on web Button with "Product"
    And Click on web Button with "Combos"
    And Click on web Button with "New Combo"
    And Enter "Automation Combo" into "Name" Input web
    And Click on web Button with "Create Combo"
    And Click on web Button with "Save"
    And Click on web Button with "Attach to branch"
    And Click on web Button with "Activate"
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
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    And Click on "Pickup from a restaurant" button
    And Click on "Choose a restaurant" button
    And Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    And Click on "KTM Test Branch" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "Combo" text is displayed
    Then Verify that the "Combo" text is displayed
    When Click on "Combo" button
    Then Verify that the "Add to order" text is displayed
    When Click on "Add to order" button

  @smoke @CartBasket
  Scenario: Verify item addition/removal, quantity changes, price calculation, taxes, delivery fees, and cart persistence.
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
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "ChannelPicker" button
    And Click on "Delivery" button
    And Click on "Choose an address" button
    And Swipe "left" until "KTM OFFICE" text is displayed
    And Click on "KTM OFFICE" button
    And Click on "Choose this location" button
    And Click on "Choose this location" button
    And Scroll "down" until "cola" text is displayed
    And Click on "cola" button
    And Click on "Add button" button
    And Click on "Reduce button" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    Then Verify that the "Taxes" text is displayed
    And Verify that the "Delivery" text is displayed
    When Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on "View Basket" button
    Then Verify that the "cola" text is displayed
    When Click on "Remove" button

  @smoke @OrderTracking
  Scenario: Verify order status updates such as placed, accepted, preparing, ready, served, delivered, cancelled, etc.
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Verify that the "Preparing" text is displayed
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
    And Verify that the "Packing" text is displayed
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
