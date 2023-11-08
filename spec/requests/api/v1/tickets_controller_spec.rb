# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TicketsController do
  describe '#create' do
    subject(:create_ticket_request) { post api_v1_tickets_path(params: request_json) }

    context 'when correct params are passed' do
      let(:request_json) { JSON.parse(File.read('spec/fixtures/valid_request.json')) }

      it 'has successful status' do
        create_ticket_request
        expect(response).to have_http_status(:created)
      end

      it 'renders correct jbuilder partial' do
        expect(create_ticket_request).to render_template(:show)
      end

      it 'adds new ticket to db' do
        expect { create_ticket_request }.to change(Ticket, :count).by(1)
      end

      it 'adds new excavator to db' do
        expect { create_ticket_request }.to change(Excavator, :count).by(1)
      end
    end

    context 'when pass invalid params' do
      let(:request_json) { JSON.parse(File.read('spec/fixtures/invalid_request.json')) }

      it 'returns unprocessible entity error' do
        create_ticket_request
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not render jbuilder partial' do
        expect(create_ticket_request).not_to render_template(:show)
      end

      it 'does not create new ticket' do
        expect { create_ticket_request }.not_to change(Ticket, :count)
      end

      it 'does not create new excavator' do
        expect { create_ticket_request }.not_to change(Excavator, :count)
      end
    end
  end
end
