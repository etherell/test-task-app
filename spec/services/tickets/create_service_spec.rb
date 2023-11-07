# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::CreateService do
  let(:request_number) { '09252012-00001' }
  let(:ticket_params) do
    {
      request_number: request_number,
      sequence_number: '2421',
      request_type: 'Normal',
      request_action: 'Restake',
      date_times: { response_due_date_time: '2011/07/13 23:59:59' },
      excavation_info: { digsite_info: { well_known_text: 'well known text' } },
      service_area: { primary_service_area_code: { sa_code: 'ZZGL103' },
                      additional_service_area_codes: { sa_code: %w[ZZL01 ZZL02 ZZL03] } }
    }
  end
  let(:excavator_params) do
    {
      company_name: 'John Doe CONSTRUCTION',
      address: '555 Some RD',
      city: 'SOME PARK',
      state: 'ZZ',
      zip: '55555',
      crew_onsite: 'true'
    }
  end
  let!(:create_service) { described_class.new(ticket_params, excavator_params) }

  describe '#call' do
    subject(:service_call) { create_service.call }

    context 'with correct params' do
      it 'creates new ticket in db' do
        expect { service_call }.to change(Ticket, :count).by(1)
      end

      it 'creates new excavator in db' do
        expect { service_call }.to change(Excavator, :count).by(1)
      end

      it 'does not return errors' do
        expect(service_call.errors.full_messages).to be_empty
      end
    end

    context 'with incorrect params' do
      let(:request_number) { '' }

      it 'does not create new ticket' do
        expect { service_call }.not_to change(Ticket, :count)
      end

      it 'does not create new excavator' do
        expect { service_call }.not_to change(Excavator, :count)
      end

      it 'returns errors' do
        expect(service_call.errors.full_messages).to be_present
      end
    end
  end
end
