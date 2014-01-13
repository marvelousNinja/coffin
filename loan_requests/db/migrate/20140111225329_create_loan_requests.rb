class CreateLoanRequests < ActiveRecord::Migration
  def change
    create_table :loan_requests do |t|
      t.integer :sum
      t.string :interval

      t.string :current_location_type
      t.integer :dependants_count
      t.integer :average_income
      t.boolean :has_real_estate
      t.boolean :has_car
      t.boolean :lives_by_registration_address

      t.timestamps
    end
  end
end
