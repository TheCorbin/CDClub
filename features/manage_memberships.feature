Feature: Assign Members To Season
  In Order to have a meaningful CD club experience
  As an Admin
  I want to assign members to a season

  Scenario: Admin assigns 12 members to season
    Given one season exists
    And 12 members exist
    And I'm on the seasons index page
    When I follow "Edit"
    Then I should be on the edit page for that season
    And I assign a different member to each of the 12 months
    And I press "Update Season"
    Then I should see those 12 members assigned to the correct months

  Scenario: Admin can save a season with blank memberships
    Given one season exists
    And one member exists
    And I'm on that season's edit page
    When I assign that member to one month
    And I press "Update Season"
    Then I should see "no duplicate members allowed"
    And that season should have no duplicate members

  Scenario: Admin swaps months for two members
    Given one season exists
    And 2 members exist
    And "Member1" is assigned to "January"
    And "Member2" is assigned to "February"
    And I'm on the edit page for that season
    When I assign "Member2" to "January"
    And I assign "Member1" to "February"
    And I press "Update Season"
    Then I should see "Member2" assigned to "January"
    And I should see "Member1" assigned to "February"

  Scenario: Admin assigns two members to a season
    Given one season exists
    And 2 members exist
    And I'm on the seasons index page
    When I follow "Edit"
    And I assign a different member to 2 months
    And I press "Update Season"
    Then I should see those 2 members assigned to the correct months

  Scenario: Admin removes a member from a season
    Given one season exists
    And a member has been assigned to that season
    And I'm on the seasons index page
    When I follow "Edit"
    And I select "Select a Member" from "Member"
    And I press "Update Season"
    Then I should see that member has been removed from that season

  Scenario: Admin cannot assign member to two different months
    Given one season exists
    And one member exists
    And I'm on that season's edit page
    When I assign that member to two different months
    And I press "Update Season"
    Then I should see "You can not assign a member to two different months"
