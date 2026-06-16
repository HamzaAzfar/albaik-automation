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

