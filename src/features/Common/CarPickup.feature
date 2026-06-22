@CarPickupE2E
Feature: Verify that the curbside order works as expected

  @CarPickup
  Scenario: Place a Car pickup order on mobile and verify on web admin panel
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-curbside"
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
  #   Then Click on web Button with "Prepared"


  @Regression @TC_Regression_Car-Pickup_002
  Scenario: Verify that the restaurant panel clearly shows the Car Pickup order in the order list.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-curbside"
    Then Turn "on" Mobile location
    Then Click on "I have Arrived" button
    Then Kill app and open it again
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on the order with captured order ID
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID

  @Regression @TC_Regression_Car-Pickup_003
  Scenario: Verify that the car pickup with the QR code is working fine.
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    And I navigate to deep link "albaik://curbside/37" to bypass QR scan
    Then Verify any Arabic text is displayed on the screen

  @Regression @TC_Regression_Car-Pickup_004
  Scenario: Verify after placing and paying for the order, the app allows the customer to cancel the order within 2 minutes.
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
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

  @Regression @TC_Regression_Car-Pickup_005
  Scenario: Verify that the TM can click the "I can't deliver this order" button.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then navigate to the curbside web panel
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-curbside"
    Then Turn "on" Mobile location
    Then Click on "I have Arrived" button
    Then Kill app and open it again
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on the order with captured order ID
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then navigate to the curbside web panel
    Then login to the curbside panel with phone "536440699" and password "Kualitatem123"
    Then Click on web Button with "Assign Order to me"
    Then Click on web Button with "Assign manually"
    Then Enter captured order ID into input field "search"
    Then Click on web Button with "Assign Order"
    Then Click on web Button with "I can't deliver this order"

  @Regression @TC_Regression_Car-Pickup_006
  Scenario: Verify that the app allows the TM to close an order after giving food to the customer by pressing on delivered button.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then navigate to the curbside web panel
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-curbside"
    Then Turn "on" Mobile location
    Then Click on "I have Arrived" button
    Then Kill app and open it again
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on the order with captured order ID
    Then navigate to the web admin panel
    Then login to the admin panel
    Then the restaurant panel is loaded and ready
    Then Click on web Button with "/admin/orders"
    Then Enter captured order ID into input field "search"
    Then Hit "Enter" key in web
    Then Click on the order with captured order ID
    Then navigate to the curbside web panel
    Then login to the curbside panel with phone "536440699" and password "Kualitatem123"
    Then Click on web Button with "Assign Order to me"
    Then Click on web Button with "Assign manually"
    Then Enter captured order ID into input field "search"
    Then Verify "Assign Order" text on web
    Then Click on web Button with "Assign Order"
    Then Click on web Button with "Deliver Order"

  @Regression @TC_Regression_Car-Pickup_007
  Scenario: Verify that the system shows a message to the customer on the ODS "To help us find you, please turn on your hazard lights" when TM scans the yellow receipt/Enters the order number.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then navigate to the curbside web panel
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
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
    Then Click on web Button with "Print Receipt & Start Collecting"
    Then accept web alert
    Then Click on the order with captured order ID
    Then Click on web Button with "Prepared"
    Then navigate to the curbside web panel
    Then login to the curbside panel with phone "536440699" and password "Kualitatem123"
    Then Click on web Button with "Assign Order to me"
    Then Click on web Button with "Assign manually"
    Then Enter captured order ID into input field "search"
    Then Verify "Assign Order" text on web
    Then Click on web Button with "Assign Order"
    Then Verify that the "To help us find you, please turn on your hazard lights" text is displayed

  @Regression @TC_Regression_Car-Pickup_010
  Scenario: Verify that when the user does not select the 'Bring to My car' option, the order will be treated as a simple Pickup.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Car Pickup" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button

  @Regression @TC_Regression_Car-Pickup_011
  Scenario: Verify that when the user selects the 'Bring to My car' option, the order will be treated as Car Pickup.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then navigate to the curbside web panel
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Kill app and open it again
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "bring it to my car" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input

  @Regression @TC_Regression_Car-Pickup_013
  Scenario: Verify that when the user selects the 'Bring to My car' option, the order will be treated as Car Pickup.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Verify that the "Choose Car" text is displayed


  @Regression @TC_Regression_Car-Pickup_015
  Scenario: Verify that the user can select/unselect the "Bring it to my car" option to change the order type from the checkout page.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then navigate to the curbside web panel
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Verify that the "Choose this car" text is displayed
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button

  @Regression @TC_Regression_Car-Pickup_0017
  Scenario: Verify that the "I Have Arrived" button is functional and performs the intended action (with location ON and OFF).
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then navigate to the curbside web panel
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Capture and store order id from tracking card "tracking-curbside"
    Then Turn "on" Mobile location
    Then Click on "I have Arrived" button
    Then Kill app and open it again

  @Regression @TC_Regression_Car-Pickup_018 @RegressionTest1
  Scenario: Verify that the WhatsApp and call icons are functional and redirects the user to WhatsApp or phone dialler when tapped.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button
    Then wait untill "#S" text is displayed
    Then Turn "on" Mobile location
    Then Click on "I have Arrived" button
    Then Click on "WhatsApp" button
    Then Click on "Call" button

  @Regression @TC_Regression_Car-Pickup_020 @RegressionTest1
  Scenario: Verify that the user can "create a Car" against the Car Pickup order.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Add Car" button
    Then Enter "Toyota" into "Brand" Input
    Then Enter "Corolla" into "Model" Input
    Then Enter "Red" into "Color" Input
    Then Enter "ABC-1234" into "Plate Number" Input
    Then Click on "Continue" button

  @Regression @TC_Regression_Car-Pickup_021 @RegressionTest1
  Scenario: Verify that the user can add a car with the "Add Car" button and edit the car with the Edit icon on the "Saved Cars" page.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Verify that the "Saved Cars" text is displayed
    Then Verify that the "Add Car" text is displayed
    Then Click on "Add Car" button
    Then Enter "Toyota" into "Brand" Input
    Then Enter "Corolla" into "Model" Input
    Then Enter "Red" into "Color" Input
    Then Enter "ABC-1234" into "Plate Number" Input
    Then Click on "Save Car" button
    Then Click on "Edit" button
    Then Enter "Blue" into "Color" Input
    Then Click on "Save Car" button
    Then Click on "Choose this car" button
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button

  @Regression @TC_Regression_Car-Pickup_023 @RegressionTest1
  Scenario: Verify if the user taps the "Skip and collect Inside Store" option, the order will become a normal "Pickup" Order.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Click on "Skip & Collect Inside Store" button
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button

  @Regression @TC_Regression_Car-Pickup_024 @RegressionTest1
  Scenario: Verify the "Car Pickup" feature when location is OFF.
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "KTM Test Branch" button
    Then Click on "bring it to my car" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Choose this car" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button

  @Regression @TC_Regression_Car-Pickup_025 @RegressionTest1
  Scenario: Verify the "Car Pickup" feature against the restaurants that do not support "car pickup".
    Then Click on "android:id/button2" button
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on "ChannelPicker" button
    Then Click on "Pickup from a restaurant" button
    Then Click on "Choose a restaurant" button
    Then Click on "Search manually" button
    Then Enter "Non Car Pickup Branch" into "City, Branch" Input
    Then Hit "Enter" key
    Then Click on "Non Car Pickup Branch" button
    Then Click on "Order Here" button until it disappears
    Then Scroll "down" until "moon" text is displayed
    Then Click on "moon" button
    Then Click on "Add to order" button
    Then Click on "View Basket" button
    Then Click on "Confirm Order" button
    Then Click on "Continue" button
    Then Enter "123" into "checkoutCvv" Input
    Then Click on "Pay with card" button