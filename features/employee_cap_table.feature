Feature: show cap table to employees

  As an employee
  So that I can view my stakes at my company

Background: users in database and an employee logs in

  Given the following users exist:
  | email | name | password | role | company_id |
  | abc1@gmail.com | Sid | password | employee | 1 |
  | abc2@gmail.com | Pavan | password | executive | 1 |
  | abc3@gmail.com | Twisha | password | employee | 1 |
  | abc4@gmail.com | Ash | password | employee | 1 |
  Given the following stakes exist:
  | company_id | user_id | stake |
  | 1    | 3 | 20 |
  | 1 | 4 | 20 |
  | 1    | 2 | 50 |
  | 1    | 1 | 10 |
  Given the following companies exist:
  | name |
  | Martian | 
  Given "Twisha" has logged in

Scenario: view cap table as employee
  When I go to the cap table page for "Martian"
  Then I should see the stake of "Twisha" for "Martian"
  And I should see the stake of "Pavan" for "Martian"
  And I should see the stake of "Utkarsh" for "Martian"
  And I should see the stake of "Sid" for "Martian"
  And the stake of "Twisha" for "Martian" should be "20"
