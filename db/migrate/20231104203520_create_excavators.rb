class CreateExcavators < ActiveRecord::Migration[7.1]
  def change
    create_table :excavators do |t|
      t.string :company_name, null: false
      t.string :address, null: false
      t.boolean :crew_onsite, default: false, null: false
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
