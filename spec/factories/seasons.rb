FactoryGirl.define do
  factory :season do
    sequence(:name) { |n| "Season#{n}" }
    sequence(:beginning_date) { |n| Date.parse("2016-01-03") + n.days }
    sequence(:ending_date) { |n| Date.parse("2016-12-31") + n.days }
  end

end
