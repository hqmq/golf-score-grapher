Feature: Course Details Screen
  As a guest
  I should see graphs and details about a given course.

  Scenario: Course details page
    When I go to the course detail page for "1"
    Then I should see a history of games played
    And I should see a calculated par for the course
    And I should see a graph of the par for the course
    And I should see top 5 records