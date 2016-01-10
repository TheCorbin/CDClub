FactoryGirl.define do
  factory :membership do
    member
    season
    sequence(:month) { |n| Date::MONTHNAMES[1..-1][(n - 1) % 12] }
  end
end
