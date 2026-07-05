@Driver
Feature: Driver App
    Verify that the driver is able to deliver the orders and track the status through the application.

    @Regression @TC_Regression_Driver_App_001 @Driver
    Scenario: Verify that the driver can successfully set their status to "Active" within the Driver App.
        When navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Restaurants"
        And Click on web Button with "Branches"
        And Click on web Button with "KTM Test Branch"
        And Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed


    @Regression @TC_Regression_Driver_App_002 @Driver
    Scenario: Verify that the driver is able to successfully join the restaurant queue from the Driver App.
        When navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Restaurants"
        And Click on web Button with "Branches"
        And Click on web Button with "KTM Test Branch"
        And Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        When Click on "Join restaurant queue" button

    @Regression @TC_Regression_Driver_App_003 @Driver
    Scenario: Verify that once a driver joins the queue, a queue number is assigned, and delivery orders are allocated based on this assigned number.
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
        And Complete dynamic checkout with CVV "123"
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
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "I have arrived" text is displayed

    @Regression @TC_Regression_Driver_App_004
    Scenario: Ensure that the system is able to assign a delivery order to the driver when they  are in an appropriate status.
        When navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Restaurants"
        And Click on web Button with "Branches"
        And Click on web Button with "KTM Test Branch"
        And Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
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
        And Complete dynamic checkout with CVV "123"
        And Click on "Pay" button
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
        And navigate to the web admin panel
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        When Click on "Customer Location" button
        And Click on "Restaurant directions" button
        And Click on "I have arrived" button
        Then I verify text "The order is ready to be collected" is displayed
        When Click on "Scan receipt" button
        And Click on "Enter order number" button
        And Enter captured order ID into "receipt number" Input
        And Click on "Submit" button

    @Regression @TC_Regression_Driver_App_005 @Driver
    Scenario: Verify that once the driver has picked up the order, they can proceed by clicking on the "Start Delivering" option, and are also able to mark the order as "Failed" if necessary.
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
        And Complete dynamic checkout with CVV "123"
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
        And navigate to the web admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Restaurants"
        And Click on web Button with "Branches"
        And Click on web Button with "KTM Test Branch"
        And Click on web Button with "Driver queue"
        Then If "Ramy Khairi" text is available on web, click on "Remove from queue" button
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        When Click on "Join restaurant queue" button
        Then Verify that the "KTM Test Branch" text is displayed
        When Click on "i have arrived" button
        And Click on "Scan receipt" button
        And Click on "Enter order number" button
        And Enter captured order ID into "receipt number" Input
        And Click on "Submit" button
        And Click on "1" button
        And Click on "Start delivering" button
        And Click on "Problem" button
        And Click on "Problem" button
        Then Verify that the "Location not correct" text is displayed
        When Click on "location not correct" button
        And Click on "Submit" button
        And Click on "ok" button
        Then Verify that the "Deliver next order" text is displayed
        When Click on "Deliver next order" button
        And navigate to the web admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "/admin/orders"
        And Enter captured order ID into input field "search"
        And Hit "Enter" key in web
        And Click on the order with captured order ID
        And I scroll down in web
        Then Verify that the "Bad Customer address" text is displayed


    @Regression @TC_Regression_Driver_App_006 @Driver
    Scenario: Ensure that after the driver picks up the order, they are able to click on the "Start Delivering" option and proceed to complete the delivery successfully.
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
        And Complete dynamic checkout with CVV "123"
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
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "I have arrived" text is displayed
        When Click on "I have arrived" button
        And Click on "Scan receipt" button
        And Click on "Enter order number" button
        And Enter captured order ID into "receipt number" Input
        And Click on "Submit" button
        And Click on "1" button
        And Click on "Start delivering" button
        And Click on "Delivered" button
        And Click on "Delivered" button



    @Regression @TC_Regression_Driver_App_007 @Driver
    Scenario: Ensure that when the admin updates an assigned order's status to "Fail", the change is accurately reflected in the Driver App with appropriate messaging or status indication.
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
        And Complete dynamic checkout with CVV "123"
        And Click on "Pay with card" button
        Then wait untill "#S" text is displayed
        When Capture and store order id from tracking card "tracking-delivery"
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        When Click on "i have arrived" button
        And navigate to the web admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "/admin/orders"
        And Enter captured order ID into input field "search"
        And Hit "Enter" key in web
        And Click on the order with captured order ID
        And Click on web Button with "KTM Test Branch"
        And I scroll down in web
        And Click on web Button with "Fail"
        Then Verify that the "Failed" text is displayed
        And Verify that the "Join Restraunt Queue" text is displayed





    @Regression @TC_Regression_Driver_App_008
    Scenario: Verify the behavior of order assignment when the driver has marked their status as "break".
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Break" text is displayed
        When Click on "Break" button
        And navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Driver Information"
        And Click on web Button with "Driver"
        And Enter "Ramy Khairy" into "search" Input
        And Hit "Enter" key in web
        And Click on "Ramy Khairy" button
        And I scroll down in web
        Then Verify that the "Status History" text is displayed
        And Verify "Break" text on web
        And Verify "Driver started a break" text on web

    @Regression @TC_Regression_Driver_App_009
    Scenario: Verify all the cases of the orders when the driver has changed the status: Break / Accident / Gas Refill.
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Break" text is displayed
        When Click on "Break" button
        And navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Driver Information"
        And Click on web Button with "Driver"
        And Enter "Ramy Khairy" into "search" Input
        And Hit "Enter" key in web
        And Click on "Ramy Khairy" button
        And I scroll down in web
        Then Verify that the "Status History" text is displayed
        And Verify "Break" text on web
        And Verify "Driver started a break" text on web
        Given The Albaik Driver application is launched on physical device
        When Click on "Avail" button
        Then Verify that the "Accident" text is displayed
        When Click on "Accident" button
        And Click on "Yes" button
        And Click on "Yes" button
        And navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Driver Information"
        And Click on web Button with "Driver"
        And Enter "Ramy Khairy" into "search" Input
        And Hit "Enter" key in web
        And Click on "Ramy Khairy" button
        And I scroll down in web
        Then Verify that the "Status History" text is displayed
        And Verify "Accident" text on web
        Given The Albaik Driver application is launched on physical device
        When Click on "Avail" button
        Then Verify that the "Gas Refill" text is displayed
        When Click on "Gas Refill" button
        And navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Driver Information"
        And Click on web Button with "Driver"
        And Enter "Ramy Khairy" into "search" Input
        And Hit "Enter" key in web
        And Click on "Ramy Khairy" button
        And I scroll down in web
        Then Verify that the "Status History" text is displayed
        And Verify "Refilling Gas" text on web


    @Regression @TC_Regression_Driver_App_010
    Scenario: Ensure that the "Contacts" section in the Driver App functions correctly, displaying all relevant contact information as intended.
        Given The Albaik Driver application is launched on physical device
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Click on "Avail" button
        Then Verify that the "Available" text is displayed
        When Click on "Available" button
        Then I expect mobile element "DriverStatus" to contain text "Avail"
        When Kill driver app and open it again
        Then Verify that the "KTM Test Branch" text is displayed
        When Click on "Contact" button
        Then Verify that the "Contact Driver Coach" text is displayed
        And Verify that the "Contact Customer Service" text is displayed
        And Verify that the "Contact Driver Coach" button is enabled
        And Verify that the "Contact Customer Service" button is enabled
