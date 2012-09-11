Feature: Homepage
  As a guest
  I should see a generic homepage listing the most recent games

  Scenario: Visit home page
    When I go to the home page
    Then I should see "Listing games"
    And I should see a list of games in order of recency
    And I should be able to click on the course name and go to the course details page