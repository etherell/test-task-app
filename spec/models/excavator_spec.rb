# frozen_string_literal: true

# == Schema Information
#
# Table name: excavators
#
#  id           :bigint           not null, primary key
#  address      :string           not null
#  company_name :string           not null
#  crew_onsite  :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  ticket_id    :bigint           not null
#
# Indexes
#
#  index_excavators_on_ticket_id  (ticket_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_id => tickets.id)
#
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
