Given(/^I'm on the admin page$/) do
  visit('/admin')
end

Then(/^I should be on the show page for that season$/) do
  @that_season ||= Season.last
  expect(page).to have_current_path(season_path(@that_season))
end

Then(/^I should be on the show seasons index page$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I'm on the seasons index page$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I'm on the show page for that season$/) do
  pending # express the regexp above with the code you wish you had
end
