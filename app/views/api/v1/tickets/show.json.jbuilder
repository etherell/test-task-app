# frozen_string_literal: true

json.call(@record, :id, :request_number, :sequence_number, :request_type, :request_action, :response_due_date_time,
          :primary_service_area_code, :additional_service_area_codes, :digsite_info_text)

json.excavator @record.excavator, :company_name, :address, :crew_onsite
