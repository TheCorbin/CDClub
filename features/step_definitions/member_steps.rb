Given(/^two members exist$/) do
  member1 = create :member
  member2 = create :member
  @members = [member1, member2]
end

Then(/^I should see those members$/) do
  @members.each do |member|
    expect(page).to have_content(member.name)
  end
end

Given(/^one member exists$/) do
  @member = Member.create! name: 'Ryan Corbin',  email: 'Ryan@gmail.com', address: '123 Fake St, Madison, WI 53714'
end

When(/^I click on the name of that member$/) do
  click_link(@member.name)
end

Then(/^I should see the details for that member$/) do
  expect(page).to have_content(@member.name)
  expect(page).to have_content(@member.email)
  expect(page).to have_content(@member.address)
end

Given(/^I'm on the show page for that member$/) do
  visit(member_path(@member))
end

When(/^I alter the details for that member$/) do
  fill_in 'Name', with: 'James Hidigger'
  fill_in 'Email', with: 'James@gmail.com'
  fill_in 'Address', with: '123 Phony St, Madison, WI 53714'
end

Then(/^I should see the new details for that member$/) do
  @member = Member.new name: 'James Hidigger', email: 'James@gmail.com', address: '123 Phony St, Madison, WI 53714'
  step 'I should see the details for that member'
end

When(/^I follow that member's "(.*?)" link$/) do |link_name|
  click_link(link_name)
end

Then(/^I should not see that member$/) do
  expect(page).not_to have_content(@member.name)
end
