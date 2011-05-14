Feature: Co-working session list
  In order to find a co-working session
  visitor
  wants to see a list of co-working sessions
  
  Scenario: Register new event
	Given the following users:
      | uid | provider | name |
      | 31425464    | twitter   | Espen Antonsen  |
	Given I am signed in with provider "twitter"
    And I am on the new event page
    When I fill in "Starts at" with "25.05.2010"
    And I fill in "Duration" with "2"
    And I fill in "Description" with "description 1"
    And I press "Create"
    Then I should see "2010-05-25 00:00:00 UTC"