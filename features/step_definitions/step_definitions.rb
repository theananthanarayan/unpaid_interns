# encoding: UTF-8

require_relative 'actionwords'
World(Actionwords)

Given /^You enter your required information$/ do
  you_enter_your_required_information
end

Given /^You create your account$/ do
  you_create_your_account
end

Given /^I am on the home page$/ do
  i_am_on_the_home_page
end

Then /^I should see a Go to Profile link$/ do
  i_should_see_a_go_to_profile_link
end

When /^I click Go To Profile$/ do
  i_click_go_to_profile
end

Then /^I should be on the Profile page with the correct "(.*)"$/ do |p1|
  i_should_be_on_the_profile_page_with_the_correct_p1(p1)
end

Then /^I should see the correct "(.*)" "(.*)" "(.*)" "(.*)" and "(.*)"$/ do |p1, p2, p3, p4, p5|
  i_should_see_the_correct_p1_p2_p3_p4_and_p5(p1, p2, p3, p4, p5)
end
