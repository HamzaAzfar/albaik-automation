@Discounts
Feature: Discounts

    @Regression @TC_Regression_Discounts_001
    Scenario: Verify that Customer must be able to see the promotional messages and triggers without sign up or log in.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then "enable" flag of "enableDiscount" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on "Chicken" button
        Then I verify text "For You" is displayed
        Then Verify that the "promotional messages" text is displayed

    @Regression @TC_Regression_Discounts_003
    Scenario: Verify that the system must allow the admin to activate and deactivate the discount.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then "enable" flag of "enableDiscount" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on "Chicken" button
        Then I verify text "For You" is displayed

