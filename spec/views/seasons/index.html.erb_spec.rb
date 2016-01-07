require 'rails_helper'

RSpec.describe "seasons/index", type: :view do
  before(:each) do
    assign(:seasons, [create(:season, name: 'Name 1'), create(:season, name: 'Name 2')])
  end

  it "renders a list of seasons" do
    render
    assert_select "tr>td", text: /Name/, count: 2
  end
end
