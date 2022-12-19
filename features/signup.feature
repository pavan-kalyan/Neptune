Feature: sign up

  As an new visitor
  So that I can sign up to Neptune

  Background: users in database and an employee logs in

    Given the following users exist:
      | email | name | password | role | company_id | plan |
      | abc1@gmail.com | Sid | password | Employee | 1 | Free |
      | abc2@gmail.com | Pavan | password | Executive | 1 | Paid |
      | abc3@gmail.com | Twisha | password | Employee | 1 | Free |
      | abc4@gmail.com | Ash | password | Employee | 1 | Free |

  Scenario: New Executive signs up successfully
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | pk123@columbia.edu |
      | Password | pass |
      | Name | Test1 |
      | Company Name | c1 |
    And I select Executive as role
    And I press on Sign Up
    Then I should be on the Employee View page

  Scenario: New Employee signs up successfully
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | pk1234@columbia.edu |
      | Password | pass |
      | Name | Test1 |
      | Company Name | c1 |
    And I select Executive as role
    And I press on Sign Up
    Then I should be on the Employee View page

  Scenario: New Employee tries to sign up with existing email
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | abc2@gmail.com |
      | Password | pass |
      | Name | Test1 |
      | Company Name | c1 |
    And I select Executive as role
    And I press on Sign Up
    Then I should see email already exists

  Scenario: New Employee tries to sign up with a non-existent company
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | pk@columbia.edu |
      | Password | pass |
      | Name | Pavan |
      | Company Name | c100 |
    And I select Employee as role
    And I press on Sign Up
    Then I should see This company does not exist

  Scenario: New Employee tries to sign up with invalid email
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | pk1234|
      | Password | pass |
      | Name | Test1 |
      | Company Name | c1 |
    And I select Executive as role
    And I press on Sign Up
    Then I should see Sign Up

  Scenario: New Employee tries to sign up with no company input
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | pk1234@gmail.com|
      | Password | pass |
      | Name | Test1 |
    And I select Executive as role
    And I press on Sign Up
    Then I should see Please provide company name

  Scenario: New Employee tries to sign up without password
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | pk1234@gmail.com|
      | Name | Test1 |
      | Company Name | c1 |
    And I select Executive as role
    And I press on Sign Up
    Then I should see Please provide password

  Scenario: New Employee tries to sign up without a name
    Given I am on the home page
    And I follow Sign Up
    When I fill in the following:
      | Email | pk1234@gmail.com|
      | Password | pass |
      | Company Name | c1 |
    And I select Executive as role
    And I press on Sign Up
    Then I should see Please provide name
