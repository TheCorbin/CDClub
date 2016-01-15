When(/^I assign a different member to each of the (\d+) months$/) do |num_months|
  num_months.to_i.times do |i|
    month_num = i.to_i + 1
    member_name = "Member#{month_num}"
    month_name = Date::MONTHNAMES[month_num]

    within "li##{month_name.downcase}_membership" do
      step(%Q{I select "#{member_name}" from "season_memberships_attributes_#{i}_member_id"})
    end
  end
end

Then(/^I should see those (\d+) members assigned to the correct months$/) do |num_members|
  num_members.to_i.times do |i|
    j = i + 1
    member_name = "Member#{j}"
    month_name = Date::MONTHNAMES[j]
    membership = @season.memberships.find_by(month: month_name)
    expect(membership.member.name).to eq(member_name)
  end
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
