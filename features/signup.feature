Feature: sign up

  As an new visitor
  So that I can sign up to Neptune

Background: users in database and an employee logs in

  Given the following users exist:
  | email | name | password | role | company_id |
  | abc1@gmail.com | Sid | password | Employee | 1 |
  | abc2@gmail.com | Pavan | password | Executive | 1 |
  | abc3@gmail.com | Twisha | password | Employee | 1 |
  | abc4@gmail.com | Ash | password | Employee | 1 |

Scenario: New Executive signs up successfully
  Given I am on the home page
  And I follow Sign Up
  When I fill in the following:
    | Email | pk123@columbia.edu |
    | Password | pass |
    | Role | Executive |
    | Company Name | c1 |
  And I press on Sign Up
  Then I should be on the Employee View page

Scenario: New Employee signs up successfully
  Given I am on the home page
  And I follow Sign Up
  When I fill in the following:
    | Email | pk1234@columbia.edu |
    | Password | pass |
    | Role | Executive |
    | Company Name | c1 |
  And I press on Sign Up
  Then I should be on the Employee View page

Scenario: New Employee tries to sign up with a non-existent company
  Given I am on the home page
  And I follow Sign Up
  When I fill in the following:
    | Email | pk@columbia.edu |
    | Password | pass |
    | Role | Employee |
    | Company Name | c1 |
  And I press on Sign Up
  Then I should see Sign Up