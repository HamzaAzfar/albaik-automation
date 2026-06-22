@Menu_Items_Description
Feature: Menu/Items Description

    @Regression @TC_Regression_Menu_Items_Description_001 @Test123
    Scenario: Verify that the user lands on the item page upon clicking on any item in the menu page.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button

    @Regression @TC_Regression_Menu_Items_Description_005 @Test
    Scenario: Verify that all the product category selections are working fine, and show the relevant products on selection of each category.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "All" button
        Then Click on "breakfast" button
        Then Click on "Chicken" button
        Then Click on "Seafood" button
        Then Click on "Sides" button
        Then Click on "Vegetarian" button
        Then Click on "Desserts" button
        Then Click on "Beverages" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button
        Then Click on "Add to Order" button
        Then Click on "Reduce button" button
        Then Click on "Remove" button

    @Regression @TC_Regression_Menu_Items_Description_010 @Test
    Scenario: Verify that the accurate allergens with the icons are displayed.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button
        Then Scroll "down" until "Allergens" text is displayed
        Then Click on "Allergens" button

    @Regression @TC_Regression_Menu_Items_Description_011 @Test123
    Scenario: Verify that the "Add to order" button is functional and the product is added to the basket upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button
        Then Click on "Add to Order" button
        Then I verify text "View Basket" is displayed

    @Regression @TC_Regression_Menu_Items_Description_012 @Test123
    Scenario: Verify that tapping the '+' icon increases the product quantity accordingly.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button
        Then Click on "Add button" button
        Then Click on "Add to Order" button
        Then I verify text "View Basket" is displayed

    @Regression @TC_Regression_Menu_Items_Description_013 @Test
    Scenario: Verify that tapping the '-' icon decreases the product quantity accordingly.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button
        Then Click on "Add button" button
        Then Click on "Reduce button" button
        Then Click on "Add to Order" button

    @Regression @TC_Regression_Menu_Items_Description_014 @Test
    Scenario: Verify that the "Remove" button is functional and the product is removed from the basket upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button
        Then Click on "Add to Order" button
        Then Click on "Reduce button" button
        Then Click on "Remove" button

    @Regression @TC_Regression_Menu_Items_Description_015 @Test
    Scenario: Verify that the product price and currency symbol change upon changing the user's country location.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on profile icon
        Then Click on "Country" button
        Then Click on "UAE" button
        Then Click on "Save" button
        Then Scroll "down" until "Water" text is displayed
        Then Click on "Water" button

    @Regression @TC_Regression_Menu_Items_Description_016 @Test
    Scenario: Verify that customization is working for both normal and group orders.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "Chicken" button
        Then Scroll "down" until "Chicken Meal" text is displayed
        Then Click on "Chicken Meal" button
        Then Click on "Add button" button
        Then Click on "Reduce button" button
        Then Click on "Add to Order" button

    @Regression @TC_Regression_Menu_Items_Description_017 @Test
    Scenario: Verify that Variants are working fine against all the products.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "Chicken" button
        Then Scroll "down" until "Chicken Meal" text is displayed
        Then Click on "Chicken Meal" button
        Then Click on "Spicy" button
        Then Click on "Add to Order" button

    @Regression @TC_Regression_Menu_Items_Description_018
    Scenario: Verify that add-ons prices are correctly reflecting in the checkout.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "Chicken" button
        Then Scroll "down" until "Chicken Meal" text is displayed
        Then Click on "Chicken Meal" button
        Then Click on "Add-ons" button
        Then Click on "Add to Order" button
        Then Click on "View Basket" button
        Then Click on "Confirm Order" button

    @Regression @TC_Regression_Combos_001
    Scenario: Verify that the user is able to create and activate a combo.
        Given navigate to the web admin panel
        Then login to the admin panel
        Then Click on web Button with "Product"
        Then Click on web Button with "Combos"
        Then Click on web Button with "New Combo"
        Then Enter "Automation Combo" into "Name" Input web
        Then Click on web Button with "Create Combo"
        Then Click on web Button with "Save"
        Then Click on web Button with "Attach to branch"
        Then Click on web Button with "Activate"
