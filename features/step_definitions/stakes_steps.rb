require_relative '../../config/environment'

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /the following stakes exist/ do |stakes_table|
  stakes_table.hashes.each do |stake|
    Stake.create stake
  end
end

Given /the following companies exist/ do |company_table|
  company_table.hashes.each do |company|
    Company.create company
  end
end

Then /the stake of (.*) for (.*) should be (.*)/ do |user_name, company_name, stake|
  # Make sure that all the movies in the app are visible in the table
  user_id = User.find_by(user_name: user_name)
  company_id = Company.find_by(company_name: company_name)
  stake_gen = Stake.find_by(user_id: user_id, company_id: company_id)
  expect(stake_gen).to match(stake)
end

Then /I should see the stake of (.*) for (.*)/ do |user_name, company_name|
  # Make sure that all the movies in the app are visible in the table
  flag=false
  page.all('#stakes tr').each do |tr|
    if tr.has_css('td.user', text: user_name)
      expect(tr).to have_css('td.company', text: company_name)
      flag=true
    end
  end
  return flag
end