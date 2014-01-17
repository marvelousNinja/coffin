class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :basic_part
      t.integer :percent_part
      t.date :scheduled_at
      t.boolean :processed, default: false

      t.integer :loan_agreement_id

      t.timestamps
    end
  end
end
