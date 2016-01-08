require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :name => "MyString",
      :month => "MyString",
      :email => "MyString",
      :address => "MyText"
    ))
  end

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", member_path(@member), "post" do

      assert_select "input#member_name[name=?]", "member[name]"

      assert_select "input#member_month[name=?]", "member[month]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "textarea#member_address[name=?]", "member[address]"
    end
  end
end
