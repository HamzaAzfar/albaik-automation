@SavedLocation
Feature: Saved Locations - Verification of Saved Locations

  @Regression @TC_Regression_Saved_Locations_001 @Tuesday
  Scenario: Verify navigation to saved locations section at user profile.
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    Then Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    Then Verify that the "Pickup" text is displayed

  @Regression @TC_Regression_Saved_Locations_002  @Tuesday
  Scenario: Verify by default delivery locations are shown at map screen.
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    Then Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    Then Verify that the "ccf" text is displayed
    Then Swipe "left" until "Virtual force" text is displayed
    Then Swipe "left" until "KTM OFFICE" text is displayed


  @Regression @TC_Regression_Saved_Locations_003 @Tuesday
  Scenario: Verify functionality of saved locations under delivery.
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    Then Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    Then Verify that the "ccf" text is displayed
    Then Swipe "left" until "Virtual force" text is displayed
    Then Swipe "left" until "KTM OFFICE" text is displayed

  @Regression @TC_Regression_Saved_Locations_004 @Tuesday
  Scenario: Verify functionality of pickup tab at saved locations sections.
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    Then Click on "Saved Locations" button
    Then Verify that the "Pickup" text is displayed
    Then Click on "Pickup" button
    Then Verify that the "Search manually" text is displayed

  @Regression @TC_Regression_Saved_Locations_005 @Tuesday
  Scenario: Verify functionality of saved restaurants under pickup.
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    Then Click on "Saved Locations" button
    Then Verify that the "Pickup" text is displayed
    Then Click on "Pickup" button
    Then Verify that the "Search manually" text is displayed
    Then Click on "Search manually" button
    Then Verify that the "RESTAURANTS" text is displayed
    Then Verify that the "Abha-Drive thru" text is displayed

  @Regression @TC_Regression_Saved_Locations_006 @Tuesday
  Scenario: Verify functionality of open now, All branches, view all links at pickup section.
    Then Turn "off" Mobile location
    Given The Albaik application is launched on physical device
    Then Click on "android:id/button2" button
    Then Verify that the "Saudi Arabia" text is displayed
    Then Click on "Saudi Arabia" button
    Then Click on "android:id/button2" button
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then I sign out if already signed in
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Verify that the "Sign In" text is displayed
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    Then Click on "Saved Locations" button
    Then Verify that the "Pickup" text is displayed
    Then Click on "Pickup" button
    Then Verify that the "Search manually" text is displayed
    Then Click on "Search manually" button
    Then Verify that the "RESTAURANTS" text is displayed
    Then Verify that the "All" text is displayed
    Then Verify that the "Abha-Drive thru" text is displayed
    Then Enter "ktm" into "City, Branch" Input
    Then Hit "Enter" key
    Then Verify that the "KTM Test Branch" text is displayed
    Then Click on "KTM Test Branch" button
    Then Verify that the "Order Here" text is displayed
    Then Click on "Order Here" button until it disappears
    Then Verify that the "MY LIST" text is displayed


  @Regression @TC_Regression_Saved_Locations_007 @Tuesday
  Scenario: Verify functionality of add new location button at saved locations.
    Then Turn "on" Mobile location
    Given The Albaik application is launched on physical device
    Then Verify that the "Skip" text is displayed
    Then Click on "Skip" button
    Then Click on profile icon
    Then Click on "Sign In" button
    Then Enter "532255875" into "5XXXXXXXX" Input
    Then Enter "11223344" as password
    Then Click on "Sign In" button
    Then Click on profile icon
    Then Verify that the "Saved Locations" text is displayed
    Then Click on "Saved Locations" button
    Then Verify that the "Delivery" text is displayed
    Then Verify that the "Pickup" text is displayed
    Then Click on "Pickup" button
    Then Verify that the "Delivery" text is displayed
    Then Click on "Delivery" button
    Then Click on "NEW" button
    Then Verify that the "Confirm" text is displayed
    Then Click on "Confirm" button
    Then Click on "Confirm Address" button
    Then Enter "New Location" into "Building details" Input
    Then Scroll "down" until "Save and continue" text is displayed
    Then Click on "Save and continue" button
    Then Verify that the "Home" text is displayed