Feature: show cap table to employees

  As an employee
  So that I can view my stakes at my company

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
  Given I am on the home page
  And I follow Sign In
  When I fill in the following:
    | email | abc1@gmail.com |
    | password | password |
  And I press on Sign In

Scenario: view cap table as employee
  Then I should be able to see the stake of "Sid" for "Martian"
  And I should not be able to see the stake of "Pavan" for "Martian"
  And I should not be able to see the stake of "Utkarsh" for "Martian"
  And I should not be able to see the stake of "Twisha" for "Martian"
  And the stake of "Sid" for "Martian" should be "10"
