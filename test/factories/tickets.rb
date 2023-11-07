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
    designite_info_text { FFaker::Lorem.word }
  end
end
