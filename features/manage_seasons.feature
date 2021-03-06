Feature: Admin manages seasons
  In order to operate CD club
  As an admin
  I want to create seasons

Scenario: Admin creates season
  Given I'm on the admin page
  When I follow "Seasons"
    And I follow "New Season"
    And I fill in "Name" with "Cd Club 2.1"
    And I select date "1/1/2016" for "season_beginning_date"
    And I select date "12/31/2016" for "season_ending_date"
   And I press "Create Season"
  Then I should be on the show page for that season
    And I should see "Cd Club 2.1"
    And I should see "2016-01-01"
    And I should see "2016-12-31"

Scenario: Admin views seasons list
  Given two seasons exist
  And I'm on the admin page
  When I follow "Seasons"
  Then I should be on the show seasons index page
  And I should see those seasons

Scenario: Admin views individual season
  Given one season exists
  And I'm on the seasons index page
  When I click on the name of that season
  Then I should see the details for that season
  Then I see all 12 months

Scenario: Admin alters season
  Given one season exists
  And I'm on the show page for that season
  When I follow "Alter Season"
  And I alter the details for that season
  And I press "Update Season"
  Then I should see the new details for that season

Scenario: Admin deletes season
  Given one season exists
  And I'm on the seasons index page
  When I follow that season's "Destroy" link
  Then I should not see that season
