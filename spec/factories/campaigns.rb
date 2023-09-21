FactoryBot.define do
  factory :campaign do
    name { Faker::Company.name }
    actual_amount { Faker::Number.decimal}
    adjustments { Faker::Number.negative }
    association :invoice
  end
end
