class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :request_number, null: false
      t.integer :sequance_number, null: false
      t.string :request_type, null: false
      t.string :request_action, null: false
      t.datetime :response_due_date_time, null: false
      t.string :primary_service_aria_code, null: false
      t.text :additional_service_area_codes, array: true, default: []
      t.text :designite_info_text, null: false

      t.timestamps
    end
  end
end
