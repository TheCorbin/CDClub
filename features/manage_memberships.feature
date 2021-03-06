Feature: Assign Members To Season
  In Order to have a meaningful CD club experience
  As an Admin
  I want to assign members to a season

  Background:
    Given one season exists

  Scenario: Admin assigns 12 members to season
    Given 12 members exist
    And I'm on the seasons index page
    When I follow "Edit"
    Then I should be on the edit page for that season
    And I assign a different member to each of the 12 months
    And I press "Update Season"
    Then I should see those 12 members assigned to the correct months

  Scenario: Admin can save a season with blank memberships
    Given one member exists
    And I'm on that season's edit page
    When I assign that member to one month
    And I press "Update Season"
    Then I should not see "no duplicate members allowed"
    And that season should have no duplicate members

  Scenario: Admin swaps months for two members
    Given member "Ryan" exists
    And member "Stephen" exists
    And "Ryan" is assigned to "January"
    And "Stephen" is assigned to "February"
    And I'm on the edit page for that season
    When I assign "Stephen" to "January"
    And I assign "Ryan" to "February"
    And I press "Update Season"
    Then I should see "Stephen" assigned to "January"
    And I should see "Ryan" assigned to "February"

  Scenario: Admin assigns two members to a season
    Given 2 members exist
    And I'm on the seasons index page
    When I follow "Edit"
    And I assign a different member to each of the 2 months
    And I press "Update Season"
    Then I should see those 2 members assigned to the correct months

  Scenario: Admin removes a member from a season
    Given member "Ryan" exists
    And "Ryan" is assigned to "January"
    And I'm on the seasons index page
    When I follow "Edit"
    And I unassign member from "January"
    And I press "Update Season"
    Then I should not see "Ryan"

  Scenario: Admin cannot assign member to two different months
    Given one member exists
    And I'm on that season's edit page
    When I assign that member to two different months
    And I press "Update Season"
    Then I should see "There are duplicate members in this season"

  Scenario: Admin sees all 12 months listed
    When I'm on that season's edit page
    Then I see all 12 months
