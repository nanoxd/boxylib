Given(/^I visit the home page$/) do
  visit root_path
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
    page.should have_selector selector, text: text
end

Then /^I should see "(.*?)" in a link/ do |text|
  page.should have_link text
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end

And(/^I should see a sign out link$/) do
  page.should have_link('Sign Out')
end

Given /^I am not authenticated$/ do
    visit('/users/sign_out') # ensure that at least
end

And /^I am a new authenticated user$/ do
  email = 'test@test.com'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end
