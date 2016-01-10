When(/^I assign a different member to each of the (\d+) months$/) do |num_months|
  num_months.times_with_index do |i|
    member_name = "Member#{i}"
    month_name = Date.MONTHNAMES[i]
    within #month row
      step(%Q{I select "#{member_name}" from "Member"})
  end
end

Then(/^I should see those (\d+) members assigned to the correct months$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" is assigned to "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I assign "(.*?)" to "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I assign a different member to (\d+) months$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a member has been assigned to that season$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see that member has been removed from that season$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I'm on that season's membership page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I assign that member to two different months$/) do
  pending # express the regexp above with the code you wish you had
end
