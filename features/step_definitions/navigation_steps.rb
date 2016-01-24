Given(/^I'm on the admin page$/) do
  visit(admin_path)
end

Then(/^I should be on the show seasons index page$/) do
  expect(page).to have_current_path(seasons_path)
end

Given(/^I'm on the seasons index page$/) do
  visit(seasons_path)
end

Then(/^I should be on the show members index page$/) do
  expect(page).to have_current_path(members_path)
end

Given(/^I'm on the members index page$/) do
  visit(members_path)
end

Given(/^I'm on the sign up page$/) do
  visit(new_member_registration_path)
end

Then(/^I should be on the home page$/) do
  expect(page).to have_current_path(root_path)
end
