@Favorites
Feature: Favorites

    @Regression @TC_Regression_Favorites_001
    Scenario: Verify that the "favorite" button is functional and the user is redirected to the relevant screen upon tapping.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "View All" button
        Then Click on "Favorite" button
        Then I verify text "Favorite" is displayed

    @Regression @TC_Regression_Favorites_002
    Scenario: Verify that the user is able to add, remove and edit a new favorite list.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "Chicken" button
        Then Scroll "down" until "Chicken Meal" text is displayed
        Then Click on "Chicken Meal" button
        Then Click on "Heart" button
        Then Click on "Add" button
        Then Enter "My Favorite List" into "Name" Input
        Then Click on "Save" button
        Then I verify text "My Favorite List" is displayed
        Then Click on "Edit" button
        Then Enter "Updated Favorite List" into "Name" Input
        Then Click on "Save" button
        Then Scroll "left" until "Delete" text is displayed
        Then Click on "Delete" button

    @Regression @TC_Regression_Favorites_005
    Scenario: Verify that the user is able to add or remove items from the favorite list.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "View All" button
        Then Click on "My Favorite List" button
        Then Scroll "left" until "Delete" text is displayed
        Then Click on "Delete" button
        Then Click on "Chicken" button
        Then Scroll "down" until "Chicken Meal" text is displayed
        Then Click on "Chicken Meal" button
        Then Click on "Heart" button
        Then Click on "Add to List" button

    @Regression @TC_Regression_Favorites_010
    Scenario: Verify that the user is able to scroll left and right to view the items on the "My List" component on the header of the home screen.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Scroll "left" until "Favorite Item" text is displayed
        Then Scroll "right" until "My List" text is displayed

    @Regression @TC_Regression_Favorites_012
    Scenario: Verify that the user is able to add the list to the basket from the "Favorites" screen upon tapping on the "add to basket" button.
        Given The Albaik application is launched on physical device
        Then Verify that the "Skip" text is displayed
        Then Click on "Skip" button
        Then Click on profile icon
        Then I sign out if already signed in
        Then Click on "Sign In" button
        Then Enter "532255875" into "5XXXXXXXX" Input
        Then Enter "11223344" as password
        Then Click on "Sign In" button
        Then Click on "View All" button
        Then Click on "My Favorite List" button
        Then Click on "Add to Basket" button
        Then I verify text "View Basket" is displayed
