Feature: view and update profile

  As a user
  So that I can view and update my profile

  Background: users in database and an employee logs in

    Given the following users exist:
      | email | name | password | role | company_id | plan |
      | abc1@gmail.com | Sid | password | Employee | 1 | Free |
      | abc2@gmail.com | Pavan | password | Executive | 1 | Paid |
      | abc3@gmail.com | Twisha | password | Employee | 1 | Free |
      | abc4@gmail.com | Ash | password | Employee | 1 | Free    |
    Given the following stakes exist:
      | c_id | u_id | value |
      | 1    | 3 | 20 |
      | 1 | 4 | 20 |
      | 1    | 2 | 50 |
      | 1    | 1 | 10 |
    Given the following companies exist:
      | name |
      | Martian |

  Scenario: View free profile
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
      | email | abc1@gmail.com |
      | password | password |
    And I press on Sign In
    Then I should be on the Employee View page
    Then I follow Profile
    Then I should be on the Profile page
    Then I should see Free
    And I should see Upgrade to Paid

  Scenario: View paid profile
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
      | email | abc2@gmail.com |
      | password | password |
    And I press on Sign In
    Then I should be on the Employee View page
    Then I follow Profile
    Then I should be on the Profile page
    Then I should see Paid
    And I should not see Upgrade to Paid

  Scenario: Edit profile from free to paid
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
      | email | abc1@gmail.com |
      | password | password |
    And I press on Sign In
    Then I should be on the Employee View page
    Then I follow Profile
    Then I should be on the Profile page
    Then I should see Free
    And I select Paid as plan
    And I press on Update Plan
    Then I follow Profile
    And I should be on the Profile page
    Then I should see Paid
    And I should not see Upgrade to Paid

  Scenario: logout and try to access profile page
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
      | email | abc1@gmail.com |
      | password | password |
    And I press on Sign In
    Then I should be on the Employee View page
    Then I follow Logout
    Then I should see Welcome to Neptune
    And I go to profile page of user with id 1
    Then I should see Unauthorized access


