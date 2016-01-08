require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      :name => "MyString",
      :month => "MyString",
      :email => "MyString",
      :address => "MyText"
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input#member_name[name=?]", "member[name]"

      assert_select "input#member_month[name=?]", "member[month]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "textarea#member_address[name=?]", "member[address]"
    end
  end
end
