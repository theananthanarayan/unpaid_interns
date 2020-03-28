Feature: CSE Alumni Network


    Examples:
      | firstName | lastName | classYear | profilePic | advisor | hiptest-uid |
      | Bill | Gates | 2025 | https://k12education.gatesfoundation.org/wp-content/uploads/2017/10/billgates_square.jpg | Dr. Lee |  |

  Scenario: Log in
    Given I am on the home page
    Then I should see a Email and Password field
    When I type my email and password
    And click the sign in button
    Then I should be signed in

  Scenario: View Profile
    As a website user
    So that I can view information about the profile I selected
    I want to see the profile page after clicking view profile
    Given I am on the home page
    Then I should see a Go to Profile link
    When I click Go To Profile
    Then I should be on the Profile page with the correct "= id"
