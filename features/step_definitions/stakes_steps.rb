require_relative '../../config/environment'

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /the following stakes exist/ do |stakes_table|
  stakes_table.hashes.each do |stake|
    Stake.create!(stake)
  end
end

Given /the following companies exist/ do |company_table|
  company_table.hashes.each do |company|
    Company.create!(company)
  end
end

Then /the stake of (.*) for (.*) should be (.*)/ do |user_name, company_name, stake|
  # Make sure that all the movies in the app are visible in the table
  # user_id = User.find_by(user_name: user_name)
  # company_id = Company.find_by(company_name: company_name)
  # stake_gen = Stake.find_by(user_id: user_id, company_id: company_id)
  # expect(stake_gen).to match(stake)
  expect(page.body).to have_content("#{user_name} #{company_name} #{stake}".tr('\"', ''))
end

Then /I should be able to see the stake of (.*) for (.*)/ do |user_name, company_name|
  # Make sure that all the movies in the app are visible in the table
  # flag=false
  # page.all('#stakes tr').each do |tr|
  #   if tr.have_css('td.user', text: user_name)
  #     puts "here"
  #     expect(tr).to have_css('td.company', text: company_name)
  #     flag=true
  #   end
  # end
  # expect(flag).to be(true)
  expect(page.body).to have_content("#{user_name} #{company_name}".tr('\"', ''))
end

Then /I should not be able to see the stake of (.*) for (.*)/ do |user_name, company_name|
  # Make sure that all the movies in the app are visible in the table
  # flag=false
  # page.all('#stakes tr').each do |tr|
  #   if tr.have_css('td.user', text: user_name)
  #     puts "here"
  #     expect(tr).to have_css('td.company', text: company_name)
  #     flag=true
  #   end
  # end
  # expect(flag).to be(true)
  expect(page.body).to_not have_content("#{user_name} #{company_name}".tr('\"', ''))
end

# Given the following users exist:
#   | email | name | password | role | company_id |
#   | abc1@gmail.com | Sid | password | Employee | 1 |
#   | abc2@gmail.com | Pavan | password | Executive | 1 |
#   | abc3@gmail.com | Twisha | password | Employee | 1 |
#   | abc4@gmail.com | Ash | password | Employee | 1 |
#   Given the following stakes exist:
#   | c_id | u_id | value |
#   | 1    | 3 | 20 |
#   | 1 | 4 | 20 |
#   | 1    | 2 | 50 |
#   | 1    | 1 | 10 |
#   Given the following companies exist:
#   | name |
#   | Martian | 
#   Given I am on the home page
#   And I follow Sign In
#   When I fill in the following:
#     | email | abc2@gmail.com |
#     | password | password |