Feature: sign up

  As an new visitor
  So that I can sign up to Neptune

Background: users in database and an employee logs in

  Given the following users exist:
  | email | name | password | role | company_id |
  | abc1@gmail.com | Sid | password | employee | 1 |
  | abc2@gmail.com | Pavan | password | executive | 1 |
  | abc3@gmail.com | Twisha | password | employee | 1 |
  | abc4@gmail.com | Ash | password | employee | 1 |

Scenario: New Executive signs up successfully
  Given I am on the home page
  And I click on Sign Up
  Then I am on Sign Up page
  And I input my email: pk@columbia.edu and password: pass and role: Executive and company: c1
  And I click on Submit
  Then I end up on a page with my email: pk@columbia.edu displayed

Scenario: New Employee signs up successfully
  Given I am on the home page
  And I click on Sign Up
  Then I am on Sign Up page
  And I input my email: john@columbia.edu and password: pass and role: Employee and company: c1
  And I click on Submit
  Then I end up on a page with my email: john@columbia.edu displayed