Feature: Manage events
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new event
    Given I am on the new event page
    When I fill in "Starts at" with "starts_at 1"
    And I fill in "Ends at" with "ends_at 1"
    And I fill in "Description" with "description 1"
    And I press "Create"
    Then I should see "starts_at 1"
    And I should see "ends_at 1"
    And I should see "description 1"

  Scenario: Delete event
    Given the following events:
      |starts_at|ends_at|description|
      |starts_at 1|ends_at 1|description 1|
      |starts_at 2|ends_at 2|description 2|
      |starts_at 3|ends_at 3|description 3|
      |starts_at 4|ends_at 4|description 4|
    When I delete the 3rd event
    Then I should see the following events:
      |Starts at|Ends at|Description|
      |starts_at 1|ends_at 1|description 1|
      |starts_at 2|ends_at 2|description 2|
      |starts_at 4|ends_at 4|description 4|
