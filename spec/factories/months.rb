FactoryGirl.define do
  factory :month do
    sequence(:name) { |n| Date::MONTHNAMES[1..-1][(n - 1) % 12] }
    sequence(:order) { |n| (n - 1) % 12 }
  end
end
