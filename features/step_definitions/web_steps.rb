Given /^The secret code is "([^"]*)"$/ do |code|
  @@cb.set_secret_code( code, code.reverse )
end

Given /^I go to "([^"]*)"$/ do |url|
  visit url
end

Given /^I open the web app$/ do
  visit '/'
end

When /^I click on "(.*)"$/ do |text|
  click_link(text)
end

Then /^I should see "(.*)"$/ do |text|
  last_response.body.should =~ /#{text}/m
end

When /^I fill "(.*)" with "(.*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "(.*)"$/ do |name|
  click_button(name)
end

