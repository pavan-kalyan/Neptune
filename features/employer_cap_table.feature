Feature: show cap table to executives

  As an executive
  So that I can view my stakes at my company
  I want to see the stakes of everyone at my company

Background: employees in database

  Given the following users exist:
  | company_name | user_name | type |
  | Martian    | Twisha | employee |
  | Martian    | Ash | employee |
  | Martian    | Pavan | executive |
  | Martian    | Sid | employee |
  Given the following stakes exist:
  | company_name | user_name | stake |
  | Martian    | Twisha | 20 |
  | Martian    | Ash | 20 |
  | Martian    | Pavan | 50 |
  | Martian    | Sid | 10 |
  Given "Pavan" has logged in

Scenario: view cap table as employee
  When I go to the cap table page
  Then the stake for "Twisha" would be "20"
  Then the stake for "Ash" would be "20"
  Then the stake for "Sid" would be "10"
  Then the stake for "Pavan" would be "50"
