Feature: Admin manages members
  In order to operate CD club
  As an admin
  I want to create members

Scenario: Admin creates member
  Given I'm on the admin page
  When I follow "Members"
    And I follow "New Member"
    And I fill in "Name" with "Ryan Corbin"
    And I fill in "Email" with "Ryanjcorbin@gmail.com"
    And I fill in "Address" with "3409 Dawes St, Apartment B, Madison, WI 53066"
   And I press "Create Member"
  Then I should be on the show page for that member
    And I should see "Ryan Corbin"
    And I should see "Ryanjcorbin@gmail.com"
    And I should see "3409 Dawes St, Apartment B, Madison, WI 53066"

Scenario: Admin views members list
  Given 2 members exist
  And I'm on the admin page
  When I follow "Members"
  Then I should be on the show members index page
  And I should see those members

Scenario: Admin views individual member
  Given one member exists
  And I'm on the members index page
  When I click on the name of that member
  Then I should see the details for that member

Scenario: Admin alters member
  Given one member exists
  And I'm on the show page for that member
  When I follow "Alter Member"
  And I alter the details for that member
  And I press "Update Member"
  Then I should see the new details for that member

Scenario: Admin deletes member
  Given one member exists
  And I'm on the members index page
  When I follow that member's "Destroy" link
  Then I should not see that member
