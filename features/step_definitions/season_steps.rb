Given(/^two seasons exist$/) do
  season1 = Season.create! name: 'season1', beginning_date: '2016-01-01', ending_date: '2016-12-31'
  season2 = Season.create! name: 'season2', beginning_date: '2017-01-01', ending_date: '2017-12-31'
  @seasons = [season1, season2]
end

Then(/^I should see those seasons$/) do
  @seasons.each do |season|
    expect(page).to have_content(season.name)
  end
end

Given(/^one season exists$/) do
  @season = Season.create! name: 'season1', beginning_date: '2016-01-01', ending_date: '2016-12-31'
end

When(/^I click on the name of that season$/) do
  click_link(@season.name)
end

Then(/^I should see the details for that season$/) do
  expect(page).to have_content(@season.name)
  expect(page).to have_content(@season.beginning_date)
  expect(page).to have_content(@season.ending_date)
end

When(/^I alter the details for that season$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the new details for that season$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on that season's "(.*?)" button$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not see that season$/) do
  pending # express the regexp above with the code you wish you had
end
