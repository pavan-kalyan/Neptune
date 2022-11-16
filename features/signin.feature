Feature: sign in

  So that I can sign up to Neptune

Background: users in database and an employee logs in

  Given the following users exist:
  | email | name | password | role | company_id |
  | abc1@gmail.com | Sid | password | Employee | 1 |
  | pk@columbia.edu | Pavan | password | Executive | 1 |
  | abc3@gmail.com | Twisha | password | Employee | 1 |
  | abc2@gmail.com | Pavan | password | Executive | 1 |
  | abc4@gmail.com | Ash | password | Employee | 1 |
  Given the following stakes exist:
    | c_id | u_id | value |
    | 1    | 3 | 20 |
    | 1 | 4 | 20 |
    | 1    | 2 | 50 |
    | 1    | 1 | 10 |
  Given the following companies exist:
    | name |
    | Martian |

Scenario: User logs in
  Given I am on the home page
  And I follow Sign In
  When I fill in the following:
    | email | abc2@gmail.com |
    | password | password |
  And I press on Sign In
  Then I should be on the Employee View page

Scenario: Non existent user tries to log in
  Given I am on the home page
  And I follow Sign In
  When I fill in the following:
    | email | pk1@columbia.edu |
    | password | pass |
  And I press on Sign In
  Then I should see Sign In

Scenario: User tries to log in without password
  Given I am on the home page
  And I follow Sign In
  When I fill in the following:
    | email | pk1@columbia.edu |
#    | password | pass |
  And I press on Sign In
  Then I should see Sign In

Scenario: User tries to log in with incorrect password
  Given I am on the home page
  And I follow Sign In
  When I fill in the following:
    | email | pk@columbia.edu |
    | password | pass1234 |
  And I press on Sign In
  Then I should see Sign In
