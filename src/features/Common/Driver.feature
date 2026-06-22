@Driver
Feature: Driver App
    Verify that the driver is able to deliver the orders and track the status through the application.

    @Regression @TC_Regression_Driver_App_001 @Driver
    Scenario: Verify that the driver can successfully set their status to "Active" within the Driver App.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Restaurants"
        Then Click on web Button with "Branches"
        Then Click on web Button with "KTM Test Branch"
        Then Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed


    @Regression @TC_Regression_Driver_App_002 @Driver
    Scenario: Verify that the driver is able to successfully join the restaurant queue from the Driver App.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Restaurants"
        Then Click on web Button with "Branches"
        Then Click on web Button with "KTM Test Branch"
        Then Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        Then Click on "Join restaurant queue" button

    @Regression @TC_Regression_Driver_App_003 @Driver
    Scenario: Verify that once a driver joins the queue, a queue number is assigned, and delivery orders are allocated based on this assigned number.
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
        Then Complete dynamic checkout with CVV "123"
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
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "I have arrived" text is displayed

    @Regression @TC_Regression_Driver_App_004
    Scenario: Ensure that the system is able to assign a delivery order to the driver when they  are in an appropriate status.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Restaurants"
        Then Click on web Button with "Branches"
        Then Click on web Button with "KTM Test Branch"
        Then Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
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
        Then Complete dynamic checkout with CVV "123"
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
        Then navigate to the web admin panel
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        Then Click on "Customer Location" button
        Then Click on "Restaurant directions" button
        Then Click on "I have arrived" button
        Then I verify text "The order is ready to be collected" is displayed
        Then Click on "Scan receipt" button
        Then Click on "Enter order number" button
        Then Enter captured order ID into "receipt number" Input
        Then Click on "Submit" button

    @Regression @TC_Regression_Driver_App_005 @Driver
    Scenario: Verify that once the driver has picked up the order, they can proceed by clicking on the "Start Delivering" option, and are also able to mark the order as "Failed" if necessary.
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
        Then Complete dynamic checkout with CVV "123"
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
        Then navigate to the web admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Restaurants"
        Then Click on web Button with "Branches"
        Then Click on web Button with "KTM Test Branch"
        Then Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        Then Click on "Join restaurant queue" button
        Then Verify that the "KTM Test Branch" text is displayed
        Then Click on "i have arrived" button
        Then Click on "Scan receipt" button
        Then Click on "Enter order number" button
        Then Enter captured order ID into "receipt number" Input
        Then Click on "Submit" button
        Then Click on "1" button
        Then Click on "Start delivering" button
        Then Click on "Problem" button
        Then Click on "Problem" button
        Then Verify that the "Location not correct" text is displayed
        Then Click on "location not correct" button
        Then Click on "Submit" button
        Then Click on "ok" button
        Then Verify that the "Deliver next order" text is displayed
        Then Click on "Deliver next order" button
        Then navigate to the web admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "/admin/orders"
        Then Enter captured order ID into input field "search"
        Then Hit "Enter" key in web
        Then Click on the order with captured order ID
        Then I scroll down in web
        Then Verify that the "Bad Customer address" text is displayed


    @Regression @TC_Regression_Driver_App_006 @Driver
    Scenario: Ensure that after the driver picks up the order, they are able to click on the "Start Delivering" option and proceed to complete the delivery successfully.
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
        Then Complete dynamic checkout with CVV "123"
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
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "I have arrived" text is displayed
        Then Click on "I have arrived" button
        Then Click on "Scan receipt" button
        Then Click on "Enter order number" button
        Then Enter captured order ID into "receipt number" Input
        Then Click on "Submit" button
        Then Click on "1" button
        Then Click on "Start delivering" button
        Then Click on "Delivered" button
        Then Click on "Delivered" button



    @Regression @TC_Regression_Driver_App_007 @Driver
    Scenario: Ensure that when the admin updates an assigned order's status to "Fail", the change is accurately reflected in the Driver App with appropriate messaging or status indication.
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
        Then Complete dynamic checkout with CVV "123"
        Then Click on "Pay with card" button
        Then wait untill "#S" text is displayed
        Then Capture and store order id from tracking card "tracking-delivery"
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        Then Click on "i have arrived" button
        Then navigate to the web admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "/admin/orders"
        Then Enter captured order ID into input field "search"
        Then Hit "Enter" key in web
        Then Click on the order with captured order ID
        Then Click on web Button with "KTM Test Branch"
        Then I scroll down in web
        Then Click on web Button with "Fail"
        Then Verify that the "Failed" text is displayed
        Then Verify that the "Join Restraunt Queue" text is displayed





    @Regression @TC_Regression_Driver_App_008
    Scenario: Verify the behavior of order assignment when the driver has marked their status as "break".
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Break" text is displayed
        Then Click on "Break" button
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Driver Information"
        Then Click on web Button with "Driver"
        Then Enter "Ramy Khairy" into "search" Input
        Then Hit "Enter" key in web
        Then Click on "Ramy Khairy" button
        Then I scroll down in web
        Then Verify that the "Status History" text is displayed
        Then Verify "Break" text on web
        Then Verify "Driver started a break" text on web

    @Regression @TC_Regression_Driver_App_009
    Scenario: Verify all the cases of the orders when the driver has changed the status: Break / Accident / Gas Refill.
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Break" text is displayed
        Then Click on "Break" button
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Driver Information"
        Then Click on web Button with "Driver"
        Then Enter "Ramy Khairy" into "search" Input
        Then Hit "Enter" key in web
        Then Click on "Ramy Khairy" button
        Then I scroll down in web
        Then Verify that the "Status History" text is displayed
        Then Verify "Break" text on web
        Then Verify "Driver started a break" text on web
        Given The Albaik Driver application is launched on physical device
        Then Click on "Avail" button
        Then Verify that the "Accident" text is displayed
        Then Click on "Accident" button
        Then Click on "Yes" button
        Then Click on "Yes" button
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Driver Information"
        Then Click on web Button with "Driver"
        Then Enter "Ramy Khairy" into "search" Input
        Then Hit "Enter" key in web
        Then Click on "Ramy Khairy" button
        Then I scroll down in web
        Then Verify that the "Status History" text is displayed
        Then Verify "Accident" text on web
        Given The Albaik Driver application is launched on physical device
        Then Click on "Avail" button
        Then Verify that the "Gas Refill" text is displayed
        Then Click on "Gas Refill" button
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Driver Information"
        Then Click on web Button with "Driver"
        Then Enter "Ramy Khairy" into "search" Input
        Then Hit "Enter" key in web
        Then Click on "Ramy Khairy" button
        Then I scroll down in web
        Then Verify that the "Status History" text is displayed
        Then Verify "Refilling Gas" text on web


    @Regression @TC_Regression_Driver_App_010
    Scenario: Ensure that the "Contacts" section in the Driver App functions correctly, displaying all relevant contact information as intended.
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Click on "Avail" button
        Then Verify that the "Available" text is displayed
        Then Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        Then Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        Then Click on "Contact" button
        Then Verify that the "Contact Driver Coach" text is displayed
        Then Verify that the "Contact Customer Service" text is displayed
        Then Verify that the "Contact Driver Coach" button is enabled
        Then Verify that the "Contact Customer Service" button is enabled
