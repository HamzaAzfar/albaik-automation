@Menu_Items_Description
Feature: Menu/Items Description

    @Regression @TC_Regression_Menu_Items_Description_001 @Test123
    Scenario: Verify that the user lands on the item page upon clicking on any item in the menu page.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button

    @Regression @TC_Regression_Menu_Items_Description_005 @Test
    Scenario: Verify that all the product category selections are working fine, and show the relevant products on selection of each category.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "All" button
        And Click on "breakfast" button
        And Click on "Chicken" button
        And Click on "Seafood" button
        And Click on "Sides" button
        And Click on "Vegetarian" button
        And Click on "Desserts" button
        And Click on "Beverages" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button
        And Click on "Add to Order" button
        And Click on "Reduce button" button
        And Click on "Remove" button

    @Regression @TC_Regression_Menu_Items_Description_010 @Test
    Scenario: Verify that the accurate allergens with the icons are displayed.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button
        And Scroll "down" until "Allergens" text is displayed
        And Click on "Allergens" button

    @Regression @TC_Regression_Menu_Items_Description_011 @Test123
    Scenario: Verify that the "Add to order" button is functional and the product is added to the basket upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button
        And Click on "Add to Order" button
        Then I verify text "View Basket" is displayed

    @Regression @TC_Regression_Menu_Items_Description_012 @Test123
    Scenario: Verify that tapping the '+' icon increases the product quantity accordingly.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button
        And Click on "Add button" button
        And Click on "Add to Order" button
        Then I verify text "View Basket" is displayed

    @Regression @TC_Regression_Menu_Items_Description_013 @Test
    Scenario: Verify that tapping the '-' icon decreases the product quantity accordingly.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button
        And Click on "Add button" button
        And Click on "Reduce button" button
        And Click on "Add to Order" button

    @Regression @TC_Regression_Menu_Items_Description_014 @Test
    Scenario: Verify that the "Remove" button is functional and the product is removed from the basket upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button
        And Click on "Add to Order" button
        And Click on "Reduce button" button
        And Click on "Remove" button

    @Regression @TC_Regression_Menu_Items_Description_015 @Test
    Scenario: Verify that the product price and currency symbol change upon changing the user's country location.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on profile icon
        And Click on "Country" button
        And Click on "UAE" button
        And Click on "Save" button
        And Scroll "down" until "Water" text is displayed
        And Click on "Water" button

    @Regression @TC_Regression_Menu_Items_Description_016 @Test
    Scenario: Verify that customization is working for both normal and group orders.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "Chicken" button
        And Scroll "down" until "Chicken Meal" text is displayed
        And Click on "Chicken Meal" button
        And Click on "Add button" button
        And Click on "Reduce button" button
        And Click on "Add to Order" button

    @Regression @TC_Regression_Menu_Items_Description_017 @Test
    Scenario: Verify that Variants are working fine against all the products.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "Chicken" button
        And Scroll "down" until "Chicken Meal" text is displayed
        And Click on "Chicken Meal" button
        And Click on "Spicy" button
        And Click on "Add to Order" button

    @Regression @TC_Regression_Menu_Items_Description_018
    Scenario: Verify that add-ons prices are correctly reflecting in the checkout.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "Chicken" button
        And Scroll "down" until "Chicken Meal" text is displayed
        And Click on "Chicken Meal" button
        And Click on "Add-ons" button
        And Click on "Add to Order" button
        And Click on "View Basket" button
        And Click on "Confirm Order" button

    @Regression @TC_Regression_Combos_001
    Scenario: Verify that the user is able to create and activate a combo.
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
