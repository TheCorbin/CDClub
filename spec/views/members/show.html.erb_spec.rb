require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :name => "Name",
      :month => "Month",
      :email => "Email",
      :address => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Month/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
