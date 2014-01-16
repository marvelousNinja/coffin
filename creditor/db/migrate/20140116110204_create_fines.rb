class CreateFines < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.integer :loan_agreement_id

      t.timestamps
    end
  end
end
