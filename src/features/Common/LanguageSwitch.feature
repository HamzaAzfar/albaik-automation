Feature: Language Switch

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

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_001 @2Jul
  Scenario: Verify that the user is able to switch languages from Arabic to English and vice versa.
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "Language" text is displayed
    And Verify that the "English" text is displayed
    And Verify that the "العربية" text is displayed
    When Click on "العربية" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "الحساب" text is displayed
    When Click on "الحساب" button
    When Click on "English" button
    And Click on "حفظ" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Account" text is displayed

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_003 @2Jul
  Scenario: Verify that the "Save" button is functional.
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "ACCOUNT SETTINGS" text is displayed
    And Enter "TestName" into "First name" Input
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "TestName" text is displayed

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_004 @2Jul
  Scenario: Verify that the "English" and "العربية" radio button is clickable.
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "English" text is displayed
    And Verify that the "العربية" text is displayed
    When Click on "العربية" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "الحساب" text is displayed
    When Click on "الحساب" button
    When Click on "English" button
    And Click on "حفظ" button
    Then Verify that the "ChannelPicker" text is displayed

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_006 @2Jul
  Scenario: Verify that product details and order information remain the same across languages.
    When Scroll "down" until "Water" text is displayed
    And Click on "Water" button
    Then Verify that the "SAR" text is displayed
    When Click on "back" button
    And Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    When Click on "العربية" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Scroll "down" until "Water" text is displayed
    And Click on "Water" button
    Then Verify that the "SAR" text is displayed
    When Click on "back" button
    And Click on profile icon
    Then Verify that the "الحساب" text is displayed
    When Click on "الحساب" button
    When Click on "English" button
    And Click on "حفظ" button
    Then Verify that the "ChannelPicker" text is displayed

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_007 @5Jul
  Scenario: Verify that the selected language is saved for future sessions.
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    When Click on "العربية" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "تسجيل الخروج" text is displayed
    When Click on "تسجيل الخروج" button
    Then Verify that the "ChannelPicker" text is displayed
    # Ensure it's still Arabic
    When Click on profile icon
    Then Verify that the "تسجيل الدخول" text is displayed
    When Click on "تسجيل الدخول" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    When Click on "تسجيل الدخول" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "الحساب" text is displayed
    When Click on "الحساب" button
    When Click on "English" button
    And Click on "حفظ" button
    Then Verify that the "ChannelPicker" text is displayed

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_008 @5Jul
  Scenario: Verify the app UI aligns correctly when switching between left-to-right (LTR) and right-to-left (RTL) languages.
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "English" text is displayed
    When Click on "العربية" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "الحساب" text is displayed
    When Click on "الحساب" button
    When Click on "English" button
    And Click on "حفظ" button
    Then Verify that the "ChannelPicker" text is displayed

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_009 @5Jul
  Scenario: Verify that app functionality remains the same after switching languages.
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    Then Verify that the "English" text is displayed
    When Click on "العربية" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Click on profile icon
    Then Verify that the "الحساب" text is displayed
    When Click on "الحساب" button
    When Click on "English" button
    And Click on "حفظ" button
    Then Verify that the "ChannelPicker" text is displayed

  @Regression @LanguageSwitch @TC_Regression_Language_Switch_010 @5Jul
  Scenario: Verify that all UI text is translated correctly when the language is switched.
    When Click on profile icon
    Then Verify that the "Account" text is displayed
    When Click on "Account" button
    When Click on "العربية" button
    And Click on "Save" button
    Then Verify that the "ChannelPicker" text is displayed
    When Scroll "down" until "Water" text is displayed
    And Click on "Water" button
    Then Verify any Arabic text is displayed on the screen
    When Click on "back" button
    And Click on profile icon
    Then Verify that the "الحساب" text is displayed
    When Click on "الحساب" button
    When Click on "English" button
    And Click on "حفظ" button
    Then Verify that the "ChannelPicker" text is displayed
