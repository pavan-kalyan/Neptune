Feature: sign in

  So that I can sign up to Neptune

  Background: users in database and an employee logs in

    Given the following users exist:
      | email | name | password | role | company_id | plan |
      | abc1@gmail.com | Sid | password | Employee | 1 | Standard |
      | pk@columbia.edu | Pavan | password | Executive | 1 | Standard |
      | abc3@gmail.com | Twisha | password | Employee | 1 | Standard  |
      | abc4@gmail.com | Ash | password | Employee | 1 | Standard     |
      | abc2@gmail.com | Pavan | password | Executive | 1 | Premium  |
    Given the following stakes exist:
      | c_id | u_id | value |
      | 1    | 3 | 20 |
      | 1 | 4 | 20 |
      | 1    | 2 | 50 |
      | 1    | 1 | 10 |
    Given the following companies exist:
      | name |
      | Martian |

  Scenario: User logs out
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
      | email | abc2@gmail.com |
      | password | password |
    And I press on Sign In
    Then I should be on the Employee View page
    And I follow Logout
    Then I should see Neptune

