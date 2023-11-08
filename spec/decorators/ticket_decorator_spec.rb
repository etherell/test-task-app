# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketDecorator, type: :decorator do
  let(:decorated_ticket) { ticket.decorate }

  describe '#digging_coordinates' do
    let(:ticket) { create(:ticket, digsite_info_text: digsite_info_text) }
    let(:digsite_info_text) { 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))' }
    let(:expected_digging_coordinates) do
      [{ longitude: '-81.13390268058475', latitude: '32.07206917625161' },
       { longitude: '-81.14660562247929', latitude: '32.04064386441295' }]
    end

    it 'returns listing name' do
      expect(decorated_ticket.digging_coordinates).to eq(expected_digging_coordinates)
    end
  end
end
