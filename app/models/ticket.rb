# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  validates :request_number, :sequance_number, :request_type, :request_action,
            :response_due_date_time, :primary_service_aria_code, :primary_service_aria_code,
            :additional_service_area_codes, :designite_info_text, presence: true
end
