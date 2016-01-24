When(/^I assign a different member to each of the (\d+) months$/) do |num_months|
  members = Member.all

  num_months.to_i.times do |i|
    month_num = i.to_i + 1
    member = members[i]
    month_name = Date::MONTHNAMES[month_num]

    within "tr##{month_name.downcase}_membership" do
      step(%Q{I select "#{member.name}" from "season_memberships_attributes_#{i}_member_id"})
    end
  end
end

Then(/^I should see those (\d+) members assigned to the correct months$/) do |num_members|
  members = Member.all
  expect(members.size).to eq(num_members.to_i)

  num_members.to_i.times do |i|
    member = members[i]
    month_name = Date::MONTHNAMES.compact[i]
    month = Month.find_by(name: month_name)
    membership = @season.memberships.find_by(month_id: month.id)
    expect(membership.member.name).to eq(member.name)
  end
end

Given(/^"(.*?)" is assigned to "(.*?)"$/) do |member_name, month_name|
  @season.create_unfilled_memberships
  month = Month.find_by(name: month_name)
  membership = @season.memberships.find_by(month_id: month.id)
  membership.member = Member.find_by(name: member_name)
  membership.save!
end

When(/^I assign "(.*?)" to "(.*?)"$/) do |member_name, month_name|
  month_index = find_month_index month_name
  step(%Q{I select "#{member_name}" from "season_memberships_attributes_#{month_index}_member_id"})
end

Then(/^I should see "(.*?)" assigned to "(.*?)"$/) do |member_name, month_name|
  within "##{month_name.downcase}_membership" do
    expect(page).to have_content(month_name)
    expect(page).to have_content(member_name)
  end
end

Given(/^a member has been assigned to that season$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see that member has been removed from that season$/) do
  expect(page).not_to have_content(@member.name)
end

Given(/^I'm on that season's edit page$/) do
  visit(edit_season_path(@season))
end

When(/^I assign that member to two different months$/) do
  ['January', 'February'].each do |month_name|
    step(%Q{I assign "#{@member.name}" to "#{month_name}"})
  end
end

When(/^I assign that member to one month$/) do
  member_name = @member.name
  step(%Q{I select "#{member_name}" from "season_memberships_attributes_0_member_id"})
end

When(/^I unassign member from "(.*?)"$/) do |month_name|
  month_index = find_month_index(month_name)
  step(%Q{I select "" from "season_memberships_attributes_#{month_index}_member_id"})
end

Then(/^I see all 12 months$/) do
  Date::MONTHNAMES.compact.each do |month_name|
    expect(page).to have_content(month_name)
  end
end

def find_month_index month_name
  Date::MONTHNAMES.compact.find_index{ |month_str| month_str == month_name }
end
