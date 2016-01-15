Given(/^two seasons exist$/) do
  season1 = create :season
  season2 = create :season
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
  fill_in 'Name', with: 'Initial Season'
  step('I select date "2/1/2016" for "season_beginning_date"')
  step('I select date "1/31/2017" for "season_ending_date"')
end

Then(/^I should see the new details for that season$/) do
  @season = Season.new name: 'Initial Season', beginning_date: '2016-02-01', ending_date: '2017-01-31'
  step 'I should see the details for that season'
end

When(/^I follow that season's "(.*?)" link$/) do |link_name|
  click_link(link_name)
end

Then(/^I should not see that season$/) do
  expect(page).not_to have_content(@season.name)
end

Given(/^I'm on the show page for that season$/) do
  visit(season_path(@season))
end

Then(/^I should be on the edit page for that season$/) do
  expect(page).to have_current_path(edit_season_path(@season))
end
