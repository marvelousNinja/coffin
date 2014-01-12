class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.string :country
      t.string :zip_code
      t.string :address_line
      t.string :phone

      t.integer :loan_request_id

      t.timestamps
    end
  end
end
