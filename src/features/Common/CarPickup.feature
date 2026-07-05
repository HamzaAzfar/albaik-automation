@CarPickupE2E
Feature: Verify that the curbside order works as expected

  @CarPickup
  Scenario: Place a Car pickup order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-curbside"
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


  @Regression @TC_Regression_Car-Pickup_002
  Scenario: Verify that the restaurant panel clearly shows the Car Pickup order in the order list.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-curbside"
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the order with captured order ID
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID

  @Regression @TC_Regression_Car-Pickup_003
  Scenario: Verify that the car pickup with the QR code is working fine.
    Given The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    Then I navigate to deep link "albaik://curbside/37" to bypass QR scan
    And Verify any Arabic text is displayed on the screen

  @Regression @TC_Regression_Car-Pickup_004
  Scenario: Verify after placing and paying for the order, the app allows the customer to cancel the order within 2 minutes.
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
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

  @Regression @TC_Regression_Car-Pickup_005
  Scenario: Verify that the TM can click the "I can't deliver this order" button.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And navigate to the curbside web panel
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-curbside"
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the order with captured order ID
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And navigate to the curbside web panel
    And login to the curbside panel with phone "536440699" and password "Kualitatem123"
    And Click on web Button with "Assign Order to me"
    And Click on web Button with "Assign manually"
    And Enter captured order ID into input field "search"
    And Click on web Button with "Assign Order"
    And Click on web Button with "I can't deliver this order"

  @Regression @TC_Regression_Car-Pickup_006
  Scenario: Verify that the app allows the TM to close an order after giving food to the customer by pressing on delivered button.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And navigate to the curbside web panel
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-curbside"
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Kill app and open it again
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on the order with captured order ID
    And navigate to the web admin panel
    And login to the admin panel
    Then the restaurant panel is loaded and ready
    When Click on web Button with "/admin/orders"
    And Enter captured order ID into input field "search"
    And Hit "Enter" key in web
    And Click on the order with captured order ID
    And navigate to the curbside web panel
    And login to the curbside panel with phone "536440699" and password "Kualitatem123"
    And Click on web Button with "Assign Order to me"
    And Click on web Button with "Assign manually"
    And Enter captured order ID into input field "search"
    Then Verify "Assign Order" text on web
    When Click on web Button with "Assign Order"
    And Click on web Button with "Deliver Order"

  @Regression @TC_Regression_Car-Pickup_007
  Scenario: Verify that the system shows a message to the customer on the ODS "To help us find you, please turn on your hazard lights" when TM scans the yellow receipt/Enters the order number.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And navigate to the curbside web panel
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
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
    And Click on web Button with "Print Receipt & Start Collecting"
    And accept web alert
    And Click on the order with captured order ID
    And Click on web Button with "Prepared"
    And navigate to the curbside web panel
    And login to the curbside panel with phone "536440699" and password "Kualitatem123"
    And Click on web Button with "Assign Order to me"
    And Click on web Button with "Assign manually"
    And Enter captured order ID into input field "search"
    Then Verify "Assign Order" text on web
    When Click on web Button with "Assign Order"
    Then Verify that the "To help us find you, please turn on your hazard lights" text is displayed

  @Regression @TC_Regression_Car-Pickup_010
  Scenario: Verify that when the user does not select the 'Bring to My car' option, the order will be treated as a simple Pickup.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Pickup from a restaurant" button
    And Click on "Choose a restaurant" button
    And Click on "Car Pickup" button
    And Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    And Click on "KTM Test Branch" button
    And Click on "bring it to my car" button

  @Regression @TC_Regression_Car-Pickup_011
  Scenario: Verify that when the user selects the 'Bring to My car' option, the order will be treated as Car Pickup.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And navigate to the curbside web panel
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Kill app and open it again
    And Click on "Pickup from a restaurant" button
    And Click on "Choose a restaurant" button
    And Click on "Search manually" button
    And Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    And Click on "KTM Test Branch" button
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "bring it to my car" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input

  @Regression @TC_Regression_Car-Pickup_013
  Scenario: Verify that when the user selects the 'Bring to My car' option, the order will be treated as Car Pickup.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    Then Verify that the "Choose Car" text is displayed


  @Regression @TC_Regression_Car-Pickup_015
  Scenario: Verify that the user can select/unselect the "Bring it to my car" option to change the order type from the checkout page.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And navigate to the curbside web panel
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    Then Verify that the "Choose this car" text is displayed
    When Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button

  @Regression @TC_Regression_Car-Pickup_0017
  Scenario: Verify that the "I Have Arrived" button is functional and performs the intended action (with location ON and OFF).
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And navigate to the curbside web panel
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    When Capture and store order id from tracking card "tracking-curbside"
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Kill app and open it again

  @Regression @TC_Regression_Car-Pickup_018 @RegressionTest1
  Scenario: Verify that the WhatsApp and call icons are functional and redirects the user to WhatsApp or phone dialler when tapped.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Given Turn "on" Mobile location
    When Click on "I have Arrived" button
    And Click on "WhatsApp" button
    And Click on "Call" button

  @Regression @TC_Regression_Car-Pickup_020 @RegressionTest1
  Scenario: Verify that the user can "create a Car" against the Car Pickup order.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Add Car" button
    And Enter "Toyota" into "Brand" Input
    And Enter "Corolla" into "Model" Input
    And Enter "Red" into "Color" Input
    And Enter "ABC-1234" into "Plate Number" Input
    And Click on "Continue" button

  @Regression @TC_Regression_Car-Pickup_021 @RegressionTest1
  Scenario: Verify that the user can add a car with the "Add Car" button and edit the car with the Edit icon on the "Saved Cars" page.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    Then Verify that the "Saved Cars" text is displayed
    And Verify that the "Add Car" text is displayed
    When Click on "Add Car" button
    And Enter "Toyota" into "Brand" Input
    And Enter "Corolla" into "Model" Input
    And Enter "Red" into "Color" Input
    And Enter "ABC-1234" into "Plate Number" Input
    And Click on "Save Car" button
    And Click on "Edit" button
    And Enter "Blue" into "Color" Input
    And Click on "Save Car" button
    And Click on "Choose this car" button
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button

  @Regression @TC_Regression_Car-Pickup_023 @RegressionTest1
  Scenario: Verify if the user taps the "Skip and collect Inside Store" option, the order will become a normal "Pickup" Order.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Click on "Skip & Collect Inside Store" button
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button

  @Regression @TC_Regression_Car-Pickup_024 @RegressionTest1
  Scenario: Verify the "Car Pickup" feature when location is OFF.
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
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
    And Click on "bring it to my car" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Choose this car" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button

  @Regression @TC_Regression_Car-Pickup_025 @RegressionTest1
  Scenario: Verify the "Car Pickup" feature against the restaurants that do not support "car pickup".
    When Click on "android:id/button2" button
    And Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on "ChannelPicker" button
    And Click on "Pickup from a restaurant" button
    And Click on "Choose a restaurant" button
    And Click on "Search manually" button
    And Enter "Non Car Pickup Branch" into "City, Branch" Input
    And Hit "Enter" key
    And Click on "Non Car Pickup Branch" button
    And Click on "Order Here" button until it disappears
    And Scroll "down" until "moon" text is displayed
    And Click on "moon" button
    And Click on "Add to order" button
    And Click on "View Basket" button
    And Click on "Confirm Order" button
    And Click on "Continue" button
    And Enter "123" into "checkoutCvv" Input
    And Click on "Pay with card" button