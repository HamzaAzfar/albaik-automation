Feature: Verification of Location switching

  Background: Login
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

  @Regression @LocationSwitch @TC_Regression_Location_Switching_001 @5Jul
  Scenario: Verify functionality of location selection screen.
    When Click on profile icon
    Then Verify that the "Country" text is displayed
    When Click on "Country" button
    Then Verify that the "Saudi Arabia" text is displayed
    And Verify that the "UAE" text is displayed
    When Click on "UAE" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed

  @Regression @LocationSwitch @TC_Regression_Location_Switching_002 @5Jul
  Scenario: Verify user can switch location to either KSA or UAE.
    When Click on profile icon
    And Click on "Country" button
    When Click on "UAE" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    And Click on "Country" button
    When Click on "Saudi Arabia" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed

  @Regression @LocationSwitch @TC_Regression_Location_Switching_003 @5Jul
  Scenario: Verify after switching location user can see relevant country restaurants and delivery address.
    When Click on profile icon
    And Click on "Country" button
    When Click on "UAE" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on "Pickup from a restaurant" button
    Then Verify that the "Select a restaurant" text is displayed

  @Regression @LocationSwitch @TC_Regression_Location_Switching_004 @5Jul
  Scenario: Verify cart and currency behavior when switching countries (e.g., KSA to UAE).
    When Scroll "down" until "Water" text is displayed
    And Click on "Water" button
    And Click on "Add to Order" button
    When Click on "back" button
    When Click on profile icon
    And Click on "Country" button
    When Click on "UAE" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Scroll "down" until "Water" text is displayed
    And Click on "Water" button
    Then Verify that the "AED" text is displayed
