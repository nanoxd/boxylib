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

  Scenario: Sign in
    Given I visit the home page
    When I click "Sign In"
    And I am a new authenticated user
    Then I should see "Signed in successfully" in the selector "p"
    And I should see a sign out link

  Scenario: Sign out
    Given I visit the home page
    And I am a new authenticated user
    When I click "Sign Out"
    Then I should see "Signed out successfully" in the selector "p"



