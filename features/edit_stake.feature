Feature: edit stake of employees

  As an Executive
  So that I can edit the stakes of all employees at my company

Background: users in database and an employee logs in

  Given the following users exist:
  | email | name | password | role | company_id |
  | abc1@gmail.com | Sid | password | Employee | 1 |
  | abc2@gmail.com | Pavan | password | Executive | 1 |
  | abc3@gmail.com | Twisha | password | Employee | 1 |
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

Scenario: edit stake page opens unsuccessfully
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
        | email | abc3@gmail.com |
        | password | password |
    And I press on Sign In
    And I follow Twisha
    Then I should be on the Action not allowed page

Scenario: edit stake page opens successfully
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
        | email | abc2@gmail.com |
        | password | password |
    And I press on Sign In
    And I follow Twisha
    Then I should be on the Edit stake page

Scenario: change stake of a user
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
        | email | abc2@gmail.com |
        | password | password |
    And I press on Sign In
    And I follow Twisha
    And I fill in the following:
        | stake | 10 |
    And I press on Save
    Then the stake of "Twisha" for "Martian" should be "10"

Scenario: go back without saving stake
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
        | email | abc2@gmail.com |
        | password | password |
    And I press on Sign In
    And I follow Ash
    And I fill in the following:
        | stake | 1000 |
    And I follow Back
    Then the stake of "Ash" for "Martian" should be "20"

Scenario: edit stake as an employee
    Given I am on the home page
    And I follow Sign In
    When I fill in the following:
        | email | abc3@gmail.com |
        | password | password |
    And I press on Sign In
    And I go to edit stake page with employee_id 3 and user_id 2
    Then I should be on the Unauthorized access page