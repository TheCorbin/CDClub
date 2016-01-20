FactoryGirl.define do
  factory :month do
    sequence(:name) { |n| Date::MONTHNAMES.compact[n]}
    sequence(:order) { |n| n}
  end
end
