@ProductSchedule
Feature: Product Schedule
    Verify that the user is able to create, view, edit, and delete product schedules.

    @Regression @TC_Regression_Product_Schedule_001
    Scenario: Verify that the user is able to create a product schedule.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Product"
        Then Click on web Button with "/admin/product_schedules"
        Then Click on web Button with "New Schedule"
        Then Click on web Button with "product input"
        Then Click on web Button with "Tahina Sauce"
        Then Click on web Button with "Country"
        Then Click on web Button with "Saudia Arabia"
        Then Enter "New Product" into "title" Input web
        Then Enter "020202" into "Start Time" Input web
        Then Enter "050502" into "End Time" Input web
        Then Enter "21052026" into "Date" Input web
        Then Click on web Button with "SUNDAY"
        Then Click on web Button with "MONDAY"
        Then Click on web Button with "TUESDAY"
        Then Click on web Button with "WEDNESDAY"
        Then Click on web Button with "THURSDAY"
        Then Click on web Button with "FRIDAY"
        Then Click on web Button with "SATURDAY"
        Then Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web


    @Regression @TC_Regression_Product_Schedule_002
    Scenario: Verify that the scheduled products should not be available in the unavailable hours.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Product"
        Then Click on web Button with "/admin/product_schedules"
        Then Click on web Button with "New Schedule"
        Then Click on web Button with "product input"
        Then Click on web Button with "Tahina Sauce"
        Then Click on web Button with "Country"
        Then Click on web Button with "Saudia Arabia"
        Then Enter "unavilable Product" into "title" Input web
        Then Enter "020202" into "Start Time" Input web
        Then Enter "050502" into "End Time" Input web
        Then Enter "21052026" into "Date" Input web
        Then Click on web Button with "SUNDAY"
        Then Click on web Button with "MONDAY"
        Then Click on web Button with "TUESDAY"
        Then Click on web Button with "WEDNESDAY"
        Then Click on web Button with "THURSDAY"
        Then Click on web Button with "FRIDAY"
        Then Click on web Button with "SATURDAY"
        Then Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "down" until "MENU" text is displayed

    @Regression @TC_Regression_Product_Schedule_003
    Scenario: Verify that the user can schedule one product only once.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Product"
        Then Click on web Button with "/admin/product_schedules"
        Then Click on web Button with "New Schedule"
        Then Click on web Button with "product input"
        Then Click on web Button with "Tahina Sauce"
        Then Click on web Button with "Country"
        Then Click on web Button with "Saudia Arabia"
        Then Enter "Duplicate Schedule" into "title" Input web
        Then Enter "020202" into "Start Time" Input web
        Then Enter "050502" into "End Time" Input web
        Then Enter "21052026" into "Date" Input web
        Then Click on web Button with "SUNDAY"
        Then Click on web Button with "MONDAY"
        Then Click on web Button with "TUESDAY"
        Then Click on web Button with "WEDNESDAY"
        Then Click on web Button with "THURSDAY"
        Then Click on web Button with "FRIDAY"
        Then Click on web Button with "SATURDAY"
        Then Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web
        Then Click on web Button with "New Schedule"
        Then Click on web Button with "product input"
        Then Click on web Button with "Tahina Sauce"
        Then Click on web Button with "Country"
        Then Click on web Button with "Saudia Arabia"
        Then Enter "Duplicate Schedule" into "title" Input web
        Then Enter "020202" into "Start Time" Input web
        Then Enter "050505" into "End Time" Input web
        Then Enter "21052026" into "Date" Input web
        Then Click on web Button with "SUNDAY"
        Then Click on web Button with "Create product schedule"

    @Regression @TC_Regression_Product_Schedule_004
    Scenario: Verify that the user can edit and delete the scheduled products.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then the restaurant panel is loaded and ready
        Then Click on web Button with "Product"
        Then Click on web Button with "/admin/product_schedules"
        Then Click on web Button with "New Schedule"
        Then Click on web Button with "product input"
        Then Click on web Button with "Tahina Sauce"
        Then Click on web Button with "Country"
        Then Click on web Button with "Saudia Arabia"
        Then Enter "New Product" into "title" Input web
        Then Enter "020202" into "Start Time" Input web
        Then Enter "050502" into "End Time" Input web
        Then Enter "21052026" into "Date" Input web
        Then Click on web Button with "SUNDAY"
        Then Click on web Button with "MONDAY"
        Then Click on web Button with "TUESDAY"
        Then Click on web Button with "WEDNESDAY"
        Then Click on web Button with "THURSDAY"
        Then Click on web Button with "FRIDAY"
        Then Click on web Button with "SATURDAY"
        Then Click on web Button with "Create product schedule"
        Then Verify "Product schedule created" text on web
        Then Click on web Button with "Product"
        Then Click on web Button with "/admin/product_schedules"
        Then I scroll down in web
        Then Click on web Button with "Tahina Sauce"
        Then Click on web Button with "New Product"
        Then Click on web Button with "THURSDAY"
        Then Click on web Button with "FRIDAY"
        Then Click on web Button with "SATURDAY"
        Then Enter "Updated Schedule" into "Title" Input web
        Then Click on web Button with "Update product schedule"
        Then Verify "Product schedule updated" text on web
        Then Click on web Button with "Delete"
        Then accept web alert
        Then Verify "Product schedule deleted" text on web
