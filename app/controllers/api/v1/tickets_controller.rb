# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ApiController
      def create
        @record = Tickets::CreateService.call(ticket_params, excavator_params)
        if @record.errors.empty?
          render :show, status: :created
        else
          render json: { errors: @record.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def ticket_params
        params.permit(:request_number, :sequence_number, :request_type, :request_action,
                      { date_times: :response_due_date_time }, { excavation_info: { digsite_info: :well_known_text } },
                      { service_area: { primary_service_area_code: :sa_code, additional_service_area_codes:
                        { sa_code: [] } } })
      end

      def excavator_params
        params.require(:excavator).permit(:company_name, :address, :city, :state, :zip, :crew_onsite)
      end
    end
  end
end
