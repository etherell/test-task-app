# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    company_name { 'MyString' }
    address { 'MyString' }
    crew_onsite { false }
    ticket { nil }
  end
end
