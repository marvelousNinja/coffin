class CreateLoanRequests < ActiveRecord::Migration
  def change
    create_table :loan_requests do |t|
      t.integer :sum, default: 0
      t.string :interval

      t.string :current_location_type
      t.integer :dependants_count, default: 0
      t.integer :average_income, default: 0
      t.boolean :has_a_real_estate
      t.boolean :has_a_car
      t.boolean :lives_by_registration_address
      t.boolean :doesnt_have_a_job

      t.timestamps
    end
  end
end
