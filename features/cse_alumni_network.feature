Feature: CSE Alumni Network


  Scenario: You want to create an account as a grad student who already graduated
    * You enter your required information
    * You create your account

  Scenario Outline: View Profile
    As a website user
    So that I can view information about the profile I selected
    I want to see the profile page after clicking view profile
    Given I am on the home page
    Then I should see a Go to Profile link
    When I click Go To Profile
    Then I should be on the Profile page with the correct "= id"
    And I should see the correct "= firstName" "= lastName" "= classYear" "= profilePic" and "= advisor"

    Examples:
      | firstName | lastName | classYear | profilePic | advisor | id | hiptest-uid |
      | Bill | Gates | 2025 | https://k12education.gatesfoundation.org/wp-content/uploads/2017/10/billgates_square.jpg | Dr. Lee | 1 |  |
