@Favorites
Feature: Favorites

    @Regression @TC_Regression_Favorites_001
    Scenario: Verify that the "favorite" button is functional and the user is redirected to the relevant screen upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "View All" button
        And Click on "Favorite" button
        Then I verify text "Favorite" is displayed

    @Regression @TC_Regression_Favorites_002
    Scenario: Verify that the user is able to add, remove and edit a new favorite list.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "Chicken" button
        And Scroll "down" until "Chicken Meal" text is displayed
        And Click on "Chicken Meal" button
        And Click on "Heart" button
        And Click on "Add" button
        And Enter "My Favorite List" into "Name" Input
        And Click on "Save" button
        Then I verify text "My Favorite List" is displayed
        When Click on "Edit" button
        And Enter "Updated Favorite List" into "Name" Input
        And Click on "Save" button
        And Scroll "left" until "Delete" text is displayed
        And Click on "Delete" button

    @Regression @TC_Regression_Favorites_005
    Scenario: Verify that the user is able to add or remove items from the favorite list.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "View All" button
        And Click on "My Favorite List" button
        And Scroll "left" until "Delete" text is displayed
        And Click on "Delete" button
        And Click on "Chicken" button
        And Scroll "down" until "Chicken Meal" text is displayed
        And Click on "Chicken Meal" button
        And Click on "Heart" button
        And Click on "Add to List" button

    @Regression @TC_Regression_Favorites_010
    Scenario: Verify that the user is able to scroll left and right to view the items on the "My List" component on the header of the home screen.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Scroll "left" until "Favorite Item" text is displayed
        And Scroll "right" until "My List" text is displayed

    @Regression @TC_Regression_Favorites_012
    Scenario: Verify that the user is able to add the list to the basket from the "Favorites" screen upon tapping on the "add to basket" button.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        When Click on "Skip" button
        And Click on profile icon
        And I sign out if already signed in
        And Click on "Sign In" button
        And Enter "MOBILE_PHONE_NUMBER" into "5XXXXXXXX" Input
        And Enter "MOBILE_PASSWORD" as password
        And Click on "Sign In" button
        And Click on "View All" button
        And Click on "My Favorite List" button
        And Click on "Add to Basket" button
        Then I verify text "View Basket" is displayed
