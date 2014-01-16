class CreatePercents < ActiveRecord::Migration
  def change
    create_table :percents do |t|
      t.integer :loan_agreement_id

      t.timestamps
    end
  end
end
