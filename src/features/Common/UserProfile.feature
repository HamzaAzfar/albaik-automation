Feature: User profile

  @Regression @TC_Regression_UserProfile_001 @Sun
  Scenario: Verify functionality of user profile icon on top right side of customer app.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    And Verify that the "Order History" text is displayed
    And Verify that the "Sign out" text is displayed

  @Regression @TC_Regression_UserProfile_002 @Sun
  Scenario: Verify functionality of account section at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "ACCOUNT SETTINGS" text is displayed
    And Verify that the "First name" text is displayed
    And Verify that the "Last name" text is displayed
    And Verify that the "Email" text is displayed
    And Verify that the "Mobile number" text is displayed
    And Verify that the "Language" text is displayed
    And Verify that the "Gender" text is displayed
    And Verify that the "Save" text is displayed

  @Regression @TC_Regression_UserProfile_003 @Sun
  Scenario: Verify functionality of order history section at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Order History" text is displayed
    When Click on "Order History" button
    Then Verify that the "ORDER HISTORY" text is displayed

  @Regression @TC_Regression_UserProfile_004 @Mon
  Scenario: Verify functionality of customer care section at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Customer Care" text is displayed
    When Click on "Customer Care" button
    Then Verify that the "CUSTOMER CARE" text is displayed

  @Regression @TC_Regression_UserProfile_005 @Mon
  Scenario: Verify functionality of payments section at user profile section.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Payments" text is displayed
    When Click on "Payments" button
    Then Verify that the "PAYMENTS" text is displayed

  @Regression @TC_Regression_UserProfile_006 @Mon
  Scenario: Verify functionality of saved locations section at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "SAVED LOCATIONS" text is displayed

  @Regression @TC_Regression_UserProfile_007 @Mon
  Scenario: Verify functionality of "privacy policy and terms of use" link at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Privacy Policy and Terms of Use" text is displayed
    When Click on "Privacy Policy and Terms of Use" button
    Then Verify that the "Privacy Policy" text is displayed

  @Regression @TC_Regression_UserProfile_008 @Mon
  Scenario: Verify functionality of "Allergens Guide" section at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Allergens Guide" text is displayed
    When Click on "Allergens Guide" button
    Then Verify that the "Allergens Guide" text is displayed

  @Regression @TC_Regression_UserProfile_009 @Mon
  Scenario: Verify functionality of "Sign out" button at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Sign out" text is displayed
    When Click on "Sign out" button
    Then Verify that the "Sign In" text is displayed

  @Regression @TC_Regression_UserProfile_010 @Mon
  Scenario: Verify functionality of "Back arrow" link at user profile.
    Given Turn "off" Mobile location
    And The Albaik application is launched on physical device
    When Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    When Click on "Saudi Arabia" button
    And Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    Then Verify that the "Sign In" text is displayed
    When Click on "Sign In" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "android:id/content" button
    Then Verify that the "Menu" text is displayed
