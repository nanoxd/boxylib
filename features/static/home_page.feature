Feature: Home Page
  In order to verify home page
  As a regular user
  I want to click on things

  Scenario: Verify logo
    Given I visit the home page
    Then I should see "BoxyLib" in the selector "h1"

  Scenario: View home in navbar
    Given I visit the home page
    Then I should see "Home" in a link

