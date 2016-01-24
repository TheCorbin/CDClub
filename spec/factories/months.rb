FactoryGirl.define do
  factory :month do
    sequence(:name) { |n| Month::NAMES[(n - 1) % 12] }
    sequence(:order) { |n| (n - 1) % 12 }
  end
end
