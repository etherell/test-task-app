# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    company_name { FFaker::Lorem.word }
    address { FFaker::Lorem.word }
    crew_onsite { false }
    ticket
  end
end
