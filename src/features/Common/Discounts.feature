@Discounts
Feature: Discounts

    @Regression @TC_Regression_Discounts_001
    Scenario: Verify that Customer must be able to see the promotional messages and triggers without sign up or log in.
        When navigate to the web admin panel
        And login to the admin panel
        Then "enable" flag of "enableDiscount" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on "Chicken" button
        Then I verify text "For You" is displayed
        And Verify that the "promotional messages" text is displayed

    @Regression @TC_Regression_Discounts_003
    Scenario: Verify that the system must allow the admin to activate and deactivate the discount.
        When navigate to the web admin panel
        And login to the admin panel
        Then "enable" flag of "enableDiscount" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on "Chicken" button
        Then I verify text "For You" is displayed

