When(/^I follow "(.*?)"$/) do |link_text|
  click_link(link_text)
end

When(/^I press "(.*?)"$/) do |button_text|
  click_button(button_text)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_label, field_text|
  fill_in field_label, with: field_text
end

Then(/^I should see "([^"]*?)"$/) do |desired_text|
  expect(page).to have_content(desired_text)
end

# Abstract way to select date with the year, month, day pulldowns that the scaffold generator uses
When(/^I select date "(.*?)" for "(.*?)"$/) do |date_str, date_field_prefix|
  month, day, year = date_str.split('/')
  month_name = Date::MONTHNAMES[month.to_i]

  step "I select \"#{year}\" from \"#{date_field_prefix}_1i\""
  step "I select \"#{month_name}\" from \"#{date_field_prefix}_2i\""
  step "I select \"#{day}\" from \"#{date_field_prefix}_3i\""
end

When(/^I select "(.*?)" from "(.*?)"$/) do |option, pulldown_label|
  select(option, from: pulldown_label)
end

Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^I debug$/) do
  binding.pry
  1+1
end
