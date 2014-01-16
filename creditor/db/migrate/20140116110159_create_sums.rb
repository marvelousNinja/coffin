class CreateSums < ActiveRecord::Migration
  def change
    create_table :sums do |t|
      t.integer :loan_agreement_id

      t.integer :initial
      t.integer :withdrawn

      t.timestamps
    end
  end
end
