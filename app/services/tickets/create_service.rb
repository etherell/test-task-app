# frozen_string_literal: true

module Tickets
  class CreateService < ApplicationService
    def initialize(ticket_params, excavator_params)
      @ticket_params = ticket_params
      @excavator_params = excavator_params
    end

    def call
      ActiveRecord::Base.transaction do
        ticket = Ticket.create!(prepared_ticket_params)
        ticket.create_excavator!(prepered_excavator_params)
        ticket
      rescue ActiveRecord::RecordInvalid => e
        e.record
      end
    end

    private

    attr_reader :ticket_params, :excavator_params

    def prepared_ticket_params
      ticket_params
        .slice(:request_number, :sequence_number, :request_type, :request_action)
        .merge(
          response_due_date_time: ticket_params[:date_times][:response_due_date_time],
          primary_service_area_code: ticket_params[:service_area][:primary_service_area_code][:sa_code],
          additional_service_area_codes: ticket_params[:service_area][:additional_service_area_codes][:sa_code],
          digsite_info_text: ticket_params[:excavation_info][:digsite_info][:well_known_text]
        )
    end

    def prepered_excavator_params
      address = excavator_params.slice(:address, :city, :state, :zip).values.join(', ')
      excavator_params.slice(:company_name, :crew_onsite).merge(address: address)
    end
  end
end
