class CreateLoanRequests < ActiveRecord::Migration
  def change
    create_table :loan_requests do |t|
      t.string :email
      t.string :name
      t.integer :sum

      t.timestamps
    end
  end
end
