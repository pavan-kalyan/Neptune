Feature: sign in

  So that I can sign up to Neptune

Background: users in database and an employee logs in

  Given the following users exist:
  | email | name | password | role | company_id |
  | abc1@gmail.com | Sid | password | Employee | 1 |
  | pk@columbia.edu | Pavan | password | Executive | 1 |
  | abc3@gmail.com | Twisha | password | Employee | 1 |
  | abc4@gmail.com | Ash | password | Employee | 1 |

Scenario: User logs in
  Given I am on the home page
  And I follow Sign In
  When I fill in the following:
    | email | pk@columbia.edu |
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
