# frozen_string_literal: true

# == Schema Information
#
# Table name: tickets
#
#  id                            :bigint           not null, primary key
#  additional_service_area_codes :text             default([]), is an Array
#  digsite_info_text             :text             not null
#  primary_service_area_code     :string           not null
#  request_action                :string           not null
#  request_number                :string           not null
#  request_type                  :string           not null
#  response_due_date_time        :datetime         not null
#  sequence_number               :integer          not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
FactoryBot.define do
  factory :ticket do
    request_number { SecureRandom.uuid }
    sequence_number { rand(1..100) }
    request_type { FFaker::Lorem.word }
    request_action { FFaker::Lorem.word }
    response_due_date_time { DateTime.now + rand(1..5).day }
    primary_service_area_code { FFaker::Lorem.word }
    additional_service_area_codes { [FFaker::Lorem.word] }
    digsite_info_text { 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))' }

    after(:create) do |ticket|
      create(:excavator, ticket: ticket)
    end
  end
end
