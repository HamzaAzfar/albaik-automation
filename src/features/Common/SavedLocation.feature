@SavedLocation
Feature: Saved Locations - Verification of Saved Locations

  @Regression @TC_Regression_Saved_Locations_001 @Tuesday
  Scenario: Verify navigation to saved locations section at user profile.
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    And Verify that the "Pickup" text is displayed

  @Regression @TC_Regression_Saved_Locations_002  @Tuesday
  Scenario: Verify by default delivery locations are shown at map screen.
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    And Verify that the "ccf" text is displayed
    When Swipe "left" until "Virtual force" text is displayed
    And Swipe "left" until "KTM OFFICE" text is displayed


  @Regression @TC_Regression_Saved_Locations_003 @Tuesday
  Scenario: Verify functionality of saved locations under delivery.
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    And Verify that the "ccf" text is displayed
    When Swipe "left" until "Virtual force" text is displayed
    And Swipe "left" until "KTM OFFICE" text is displayed

  @Regression @TC_Regression_Saved_Locations_004 @Tuesday
  Scenario: Verify functionality of pickup tab at saved locations sections.
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
    And Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "Pickup" text is displayed
    When Click on "Pickup" button
    Then Verify that the "Search manually" text is displayed

  @Regression @TC_Regression_Saved_Locations_005 @Tuesday
  Scenario: Verify functionality of saved restaurants under pickup.
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
    And Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "Pickup" text is displayed
    When Click on "Pickup" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    Then Verify that the "RESTAURANTS" text is displayed
    And Verify that the "Abha-Drive thru" text is displayed

  @Regression @TC_Regression_Saved_Locations_006 @Tuesday
  Scenario: Verify functionality of open now, All branches, view all links at pickup section.
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
    And Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "Pickup" text is displayed
    When Click on "Pickup" button
    Then Verify that the "Search manually" text is displayed
    When Click on "Search manually" button
    Then Verify that the "RESTAURANTS" text is displayed
    And Verify that the "All" text is displayed
    And Verify that the "Abha-Drive thru" text is displayed
    When Enter "ktm" into "City, Branch" Input
    And Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    When Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    When Click on "Order Here" button until it disappears
    Then Verify that the "MY LIST" text is displayed


  @Regression @TC_Regression_Saved_Locations_007 @Tuesday
  Scenario: Verify functionality of add new location button at saved locations.
    Given Turn "on" Mobile location
    And The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    When Click on "Skip" button
    And Click on profile icon
    And Click on "Sign In" button
    And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
    And Enter "MOBILE_PASSWORD" as password
    And Click on "Sign In" button
    And Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    When Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    And Verify that the "Pickup" text is displayed
    When Click on "Pickup" button
    Then Verify that the "Delivery" text is displayed
    When Click on "Delivery" button
    And Click on "NEW" button
    Then Verify that the "Confirm" text is displayed
    When Click on "Confirm" button
    And Click on "Confirm Address" button
    And Enter "New Location" into "Building details" Input
    And Scroll "down" until "Save and continue" text is displayed
    And Click on "Save and continue" button
    Then Verify that the "Home" text is displayed