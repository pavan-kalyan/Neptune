require_relative '../../config/environment'

require 'uri'
require 'cgi'

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

And /^(?:|I )follow (.+)$/ do |link|
  # puts page.body
  click_link(link)
end

And /^(?:|I )press on (.+)$/ do |button|
  click_button(button)
end

And /^(?:|I )should see (.+)$/ do |text|
  expect(page.body).to have_content(text)
end

Then /^(?:|I )should be on the (.+) page$/ do |header_name|
  expect(page.body).to have_content(header_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# based on naming conventions.
#
When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    # puts(value)
    fill_in(name, :with => value)
    # When %{I fill in "#{name}" with "#{value}"}
  end
end

And /^(?:|I )select (.+) as role$/ do |role|
  page.select(role, :from => 'role')
end
