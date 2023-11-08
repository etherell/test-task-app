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
class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  validates :request_number, :sequence_number, :request_type, :request_action,
            :response_due_date_time, :primary_service_area_code, :primary_service_area_code,
            :additional_service_area_codes, :digsite_info_text, presence: true
end
