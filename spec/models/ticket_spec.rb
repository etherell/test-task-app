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
require 'rails_helper'

RSpec.describe Ticket do
  describe 'fields' do
    it { is_expected.to have_db_column(:request_number).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:sequence_number).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:request_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:request_action).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:response_due_date_time).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:primary_service_area_code).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:additional_service_area_codes).of_type(:text).with_options(default: '[]') }
    it { is_expected.to have_db_column(:digsite_info_text).of_type(:text).with_options(null: false) }
  end
end
