# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    request_number { SecureRandom.uuid }
    sequence_number { rand(1..100) }
    request_type { FFaker::Lorem.word }
    request_action { FFaker::Lorem.word }
    response_due_date_time { DateTime.now + rand(1..5).day }
    primary_service_area_code { FFaker::Lorem.word }
    additional_service_area_codes { [FFaker::Lorem.word] }
    designite_info_text { 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295' }

    after(:create) do |ticket|
      create(:excavator, ticket: ticket)
    end
  end
end
