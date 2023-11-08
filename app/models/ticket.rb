# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  validates :request_number, :sequence_number, :request_type, :request_action,
            :response_due_date_time, :primary_service_area_code, :primary_service_area_code,
            :additional_service_area_codes, :digsite_info_text, presence: true
end
