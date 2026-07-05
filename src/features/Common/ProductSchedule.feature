@ProductSchedule
Feature: Product Schedule
    Verify that the user is able to create, view, edit, and delete product schedules.

    @Regression @TC_Regression_Product_Schedule_001
    Scenario: Verify that the user is able to create a product schedule.
        When navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Product"
        And Click on web Button with "/admin/product_schedules"
        And Click on web Button with "New Schedule"
        And Click on web Button with "product input"
        And Click on web Button with "Tahina Sauce"
        And Click on web Button with "Country"
        And Click on web Button with "Saudia Arabia"
        And Enter "New Product" into "title" Input web
        And Enter "020202" into "Start Time" Input web
        And Enter "050502" into "End Time" Input web
        And Enter "21052026" into "Date" Input web
        And Click on web Button with "SUNDAY"
        And Click on web Button with "MONDAY"
        And Click on web Button with "TUESDAY"
        And Click on web Button with "WEDNESDAY"
        And Click on web Button with "THURSDAY"
        And Click on web Button with "FRIDAY"
        And Click on web Button with "SATURDAY"
        And Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web


    @Regression @TC_Regression_Product_Schedule_002
    Scenario: Verify that the scheduled products should not be available in the unavailable hours.
        When navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Product"
        And Click on web Button with "/admin/product_schedules"
        And Click on web Button with "New Schedule"
        And Click on web Button with "product input"
        And Click on web Button with "Tahina Sauce"
        And Click on web Button with "Country"
        And Click on web Button with "Saudia Arabia"
        And Enter "unavilable Product" into "title" Input web
        And Enter "020202" into "Start Time" Input web
        And Enter "050502" into "End Time" Input web
        And Enter "21052026" into "Date" Input web
        And Click on web Button with "SUNDAY"
        And Click on web Button with "MONDAY"
        And Click on web Button with "TUESDAY"
        And Click on web Button with "WEDNESDAY"
        And Click on web Button with "THURSDAY"
        And Click on web Button with "FRIDAY"
        And Click on web Button with "SATURDAY"
        And Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "down" until "MENU" text is displayed

    @Regression @TC_Regression_Product_Schedule_003
    Scenario: Verify that the user can schedule one product only once.
        When navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Product"
        And Click on web Button with "/admin/product_schedules"
        And Click on web Button with "New Schedule"
        And Click on web Button with "product input"
        And Click on web Button with "Tahina Sauce"
        And Click on web Button with "Country"
        And Click on web Button with "Saudia Arabia"
        And Enter "Duplicate Schedule" into "title" Input web
        And Enter "020202" into "Start Time" Input web
        And Enter "050502" into "End Time" Input web
        And Enter "21052026" into "Date" Input web
        And Click on web Button with "SUNDAY"
        And Click on web Button with "MONDAY"
        And Click on web Button with "TUESDAY"
        And Click on web Button with "WEDNESDAY"
        And Click on web Button with "THURSDAY"
        And Click on web Button with "FRIDAY"
        And Click on web Button with "SATURDAY"
        And Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web
        When Click on web Button with "New Schedule"
        And Click on web Button with "product input"
        And Click on web Button with "Tahina Sauce"
        And Click on web Button with "Country"
        And Click on web Button with "Saudia Arabia"
        And Enter "Duplicate Schedule" into "title" Input web
        And Enter "020202" into "Start Time" Input web
        And Enter "050505" into "End Time" Input web
        And Enter "21052026" into "Date" Input web
        And Click on web Button with "SUNDAY"
        And Click on web Button with "Create product schedule"

    @Regression @TC_Regression_Product_Schedule_004
    Scenario: Verify that the user can edit and delete the scheduled products.
        When navigate to the web admin panel
        And login to the admin panel
        Then the restaurant panel is loaded and ready
        When Click on web Button with "Product"
        And Click on web Button with "/admin/product_schedules"
        And Click on web Button with "New Schedule"
        And Click on web Button with "product input"
        And Click on web Button with "Tahina Sauce"
        And Click on web Button with "Country"
        And Click on web Button with "Saudia Arabia"
        And Enter "New Product" into "title" Input web
        And Enter "020202" into "Start Time" Input web
        And Enter "050502" into "End Time" Input web
        And Enter "21052026" into "Date" Input web
        And Click on web Button with "SUNDAY"
        And Click on web Button with "MONDAY"
        And Click on web Button with "TUESDAY"
        And Click on web Button with "WEDNESDAY"
        And Click on web Button with "THURSDAY"
        And Click on web Button with "FRIDAY"
        And Click on web Button with "SATURDAY"
        And Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web
        When Click on web Button with "Product"
        And Click on web Button with "/admin/product_schedules"
        And I scroll down in web
        And Click on web Button with "Tahina Sauce"
        And Click on web Button with "New Product"
        And Click on web Button with "THURSDAY"
        And Click on web Button with "FRIDAY"
        And Click on web Button with "SATURDAY"
        And Enter "Updated Schedule" into "Title" Input web
        And Click on web Button with "Update product schedule"
        Then Verify "Product schedule updated" text on web
        When Click on web Button with "Delete"
        And accept web alert
        Then Verify "Product schedule deleted" text on web
