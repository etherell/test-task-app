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
class Excavator < ApplicationRecord
  belongs_to :ticket

  validates :company_name, :address, presence: true
end
