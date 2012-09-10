Feature: Game Details
  As a Guest
  I should see a page with a table of data and a graph

  Scenario: Visit the show page of a game
    When I go to "/games/1"
    Then I should see a table of data for game1
    And I should see a graph of data for game1