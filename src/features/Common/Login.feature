@Login/Register
Feature: Login/Registration

    @Regression @TC_Regression_Login_Registration_001 @Test1122
    Scenario: Verify that the user is able to enter the mobile number on the login page.
        When navigate to the web admin panel
        And login to the admin panel
        Then "disable" flag of "enableQuickRegister" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "John" into "First Name" Input
        And Enter "Doe" into "Last Name" Input
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "test@example.com" into "Email Address" Input
        And Enter "Password123" as password
        And Click on "Register" button
        And Click on profile icon
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input

    @Regression @TC_Regression_Login_Registration_002 @Test123
    Scenario: Verify that the user is able to enter a password on the login page.
        When navigate to the web admin panel
        And login to the admin panel
        Then "disable" flag of "enableQuickRegister" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "John" into "First Name" Input
        And Enter "Doe" into "Last Name" Input
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "test@example.com" into "Email Address" Input
        And Enter "Password123" as password
        And Click on "Register" button
        And Click on profile icon

    @Regression @TC_Regression_Login_Registration_003
    Scenario: Verify that the "sign in" button is functional and the user is redirected to the home page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        Then I verify text "Pickup from a restaurant" is displayed

    @Regression @TC_Regression_Login_Registration_004
    Scenario: Verify that the "sign in" button should not be functional and give error message until or unless all required fields are correctly filled.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        Then I verify text "Pickup from a restaurant" is displayed
        And Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "12345678" as password
        And Click on "Sign In" button
        Then I verify text "Sign In" is displayed

    @Regression @TC_Regression_Login_Registration_005
    Scenario: Verify that the "Need to Register" button is functional and that the user navigates to the registration page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        Then I verify text "Register" is displayed

    @Regression @TC_Regression_Login_Registration_006
    Scenario: Verify that the "Forgot your password" button is functional and the user navigates to the reset your password page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Forgot your password" button
        Then I verify text "Reset Password" is displayed

    @Regression @TC_Regression_Login_Registration_007
    Scenario: Verify that user login with invalid Credentials.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "wrongpassword" as password
        And Click on "Sign In" button
        Then I verify text "Sign In" is displayed

    @Regression @TC_Regression_Login_Registration_008
    Scenario: Verify that the "Privacy Policy and Terms of Use" button is functional and that the user navigates to the Privacy Policy and Terms of Use page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Privacy Policy and Terms of Use" button
        Then I verify text "Privacy Policy" is displayed

    @Regression @TC_Regression_Login_Registration_009
    Scenario: Verify that the user is able to enter the "first name" on the registration page.
        When navigate to the web admin panel
        And login to the admin panel
        Then "disable" flag of "enableQuickRegister" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "John" into "First Name" Input

    @Regression @TC_Regression_Login_Registration_010
    Scenario: Verify that the user is able to enter the "last name" on the registration page.
        When navigate to the web admin panel
        And login to the admin panel
        Then "disable" flag of "enableQuickRegister" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "Doe" into "Last Name" Input

    @Regression @TC_Regression_Login_Registration_011
    Scenario: Verify that the user is able to enter the "Mobile number" on the registration page.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "555555555" into "5XXXXXXXX" Input

    @Regression @TC_Regression_Login_Registration_012
    Scenario: Verify that the user is able to enter the "email address" on the registration page.
        When navigate to the web admin panel
        And login to the admin panel
        Then "disable" flag of "enableQuickRegister" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "test@example.com" into "Email Address" Input

    @Regression @TC_Regression_Login_Registration_013
    Scenario: Verify that the user is able to enter the "password" on the registration page.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "Password123" as password

    @Regression @TC_Regression_Login_Registration_014
    Scenario: Verify that the "Register" button is functional.
        When navigate to the web admin panel
        And login to the admin panel
        Then "disable" flag of "enableQuickRegister" in admin panel
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Enter "John" into "First Name" Input
        And Enter "Doe" into "Last Name" Input
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "test@example.com" into "Email Address" Input
        And Enter "Password123" as password
        And Click on "Register" button

    @Regression @TC_Regression_Login_Registration_015
    Scenario: Verify that the "Already have an account" button is functional, and the user navigates to the sign-in page upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And Click on "Sign In" button
        And Click on "Need to Register" button
        And Click on "Already have an account" button
        Then I verify text "Sign In" is displayed


