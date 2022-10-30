Feature: sign up

Scenario: New Visitor signs up successfully
Given I am a visitor
And I am on the home page
And I click on Sign up
Then I am on Sign up page
And I input my email: pk@columbia.edu and password: pass and role: employee and company: c1
And I click on Submit
Then I end up on a page with my email: pk@columbia.edu displayed