# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController do
  describe 'GET #index' do
    subject(:tickets_index) { get tickets_path }

    let!(:tickets) { create_list(:ticket, 2) }

    before { tickets_index }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'assigns correct tickets' do
      expect(assigns(:tickets)).to eq(tickets)
    end

    it 'renders correct view' do
      expect(response.status).to render_template(:index)
    end
  end

  describe 'GET #show' do
    subject(:show_ticket) { get ticket_path(id: ticket_id) }

    before { show_ticket }

    context 'when request with valid ticket id' do
      let(:ticket) { create(:ticket) }
      let(:ticket_id) { ticket.id }

      it 'returns a successful response' do
        expect(response).to be_successful
      end

      it 'assigns correct ticket' do
        expect(assigns(:ticket)).to eq(ticket)
      end

      it 'renders correct view' do
        expect(response.status).to render_template(:show)
      end
    end

    context 'when wrong ticket id' do
      let(:ticket_id) { rand(100..200) }

      it 'returns a not found response' do
        expect(response).to be_not_found
      end

      it 'does not render view' do
        expect(response.status).not_to render_template(:show)
      end

      it 'does not assign ticket' do
        expect(assigns(:ticket)).to be_nil
      end
    end
  end
end
