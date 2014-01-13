class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :upid
      t.string :working_phone
      t.string :personnel_department_phone
      t.string :accounting_department_phone
      t.string :position
      t.date :employed_at

      t.integer :loan_request_id

      t.timestamps
    end
  end
end
