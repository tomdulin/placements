FactoryBot.define do
  factory :line_item do
    name { Faker::VulnerabilityIdentifier.cve }
    booked_amount { Faker::Number.decimal }
    actual_amount { Faker::Number.decimal }
    adjustments { Faker::Number.decimal }
  end
end
