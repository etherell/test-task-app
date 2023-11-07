# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Excavator do
  describe 'fields' do
    it { is_expected.to have_db_column(:company_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:address).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:crew_onsite).of_type(:boolean).with_options(default: false) }
  end

  describe 'model relations' do
    it { is_expected.to belong_to(:ticket) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:ticket_id) }
  end
end
