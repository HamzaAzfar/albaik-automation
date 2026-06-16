@Login/Register
Feature: Login/Registration

    @Regression @TC_Regression_Login_Registration_001 @Test1122
    Scenario: Verify that the user is able to enter the mobile number on the login page.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then Disable quick register feature flag in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "John" into "First Name" Input
        Then Enter "Doe" into "Last Name" Input
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "test@example.com" into "Email Address" Input
        Then Enter "Password123" as password
        Then Click on "Register" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input

    @Regression @TC_Regression_Login_Registration_002 @Test123
    Scenario: Verify that the user is able to enter a password on the login page.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then Disable quick register feature flag in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "John" into "First Name" Input
        Then Enter "Doe" into "Last Name" Input
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "test@example.com" into "Email Address" Input
        Then Enter "Password123" as password
        Then Click on "Register" button
        Then Click on profile icon

    @Regression @TC_Regression_Login_Registration_003
    Scenario: Verify that the "sign in" button is functional and the user is redirected to the home page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
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
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then I verify text "Pickup from a restaurant" is displayed
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "12345678" as password
        Then Click on "Sign In" button
        Then I verify text "Sign In" is displayed

    @Regression @TC_Regression_Login_Registration_005
    Scenario: Verify that the "Need to Register" button is functional and that the user navigates to the registration page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then I verify text "Register" is displayed

    @Regression @TC_Regression_Login_Registration_006
    Scenario: Verify that the "Forgot your password" button is functional and the user navigates to the reset your password page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Forgot your password" button
        Then I verify text "Reset Password" is displayed

    @Regression @TC_Regression_Login_Registration_007
    Scenario: Verify that user login with invalid Credentials.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "wrongpassword" as password
        Then Click on "Sign In" button
        Then I verify text "Sign In" is displayed

    @Regression @TC_Regression_Login_Registration_008
    Scenario: Verify that the "Privacy Policy and Terms of Use" button is functional and that the user navigates to the Privacy Policy and Terms of Use page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Privacy Policy and Terms of Use" button
        Then I verify text "Privacy Policy" is displayed

    @Regression @TC_Regression_Login_Registration_009
    Scenario: Verify that the user is able to enter the "first name" on the registration page.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then Disable quick register feature flag in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "John" into "First Name" Input

    @Regression @TC_Regression_Login_Registration_010
    Scenario: Verify that the user is able to enter the "last name" on the registration page.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then Disable quick register feature flag in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "Doe" into "Last Name" Input

    @Regression @TC_Regression_Login_Registration_011
    Scenario: Verify that the user is able to enter the "Mobile number" on the registration page.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "555555555" into "5XXXXXXXX" Input

    @Regression @TC_Regression_Login_Registration_012
    Scenario: Verify that the user is able to enter the "email address" on the registration page.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then Disable quick register feature flag in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "test@example.com" into "Email Address" Input

    @Regression @TC_Regression_Login_Registration_013
    Scenario: Verify that the user is able to enter the "password" on the registration page.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "Password123" as password

    @Regression @TC_Regression_Login_Registration_014
    Scenario: Verify that the "Register" button is functional.
        Then navigate to the web admin panel
        Then login to the admin panel
        Then Disable quick register feature flag in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Enter "John" into "First Name" Input
        Then Enter "Doe" into "Last Name" Input
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "test@example.com" into "Email Address" Input
        Then Enter "Password123" as password
        Then Click on "Register" button

    @Regression @TC_Regression_Login_Registration_015
    Scenario: Verify that the "Already have an account" button is functional, and the user navigates to the sign-in page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then Click on "Sign In" button
        Then Click on "Need to Register" button
        Then Click on "Already have an account" button
        Then I verify text "Sign In" is displayed


