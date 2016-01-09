FactoryGirl.define do
  factory :member do
    sequence(:name) { |n| "Member#{n}" }
    sequence(:email) { |n| "Member#{n}@gmail.com" }
    sequence(:address) { |n| "12#{n} fake st, Madison, WI 54714" }
  end
end
