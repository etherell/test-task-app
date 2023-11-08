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
FactoryBot.define do
  factory :excavator do
    company_name { FFaker::Lorem.word }
    address { FFaker::Lorem.word }
    crew_onsite { false }
    ticket
  end
end
