@Login/Register
Feature: Login/Registration

    @Regression @TC_Regression_Login_Registration_003
    Scenario: Verify that the "sign in" button is functional and the user is redirected to the home page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on "android:id/content" button
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then I verify text "Pickup from a restaurant" is displayed

    @Regression @TC_Regression_Login_Registration_004
    Scenario: Verify that the "sign in" button should not be functional and give error message until or unless all required fields are correctly filled.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on "android:id/content" button
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then I verify text "Pickup from a restaurant" is displayed
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on "android:id/content" button
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "12345678" as password
        Then Click on "Sign In" button
        Then I verify text "Sign In" is displayed
