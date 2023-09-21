# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    sequence(:name) { |i| Faker::Name.first_name + i.to_s + " " + Faker::Name.last_name + i.to_s }
  end
end
