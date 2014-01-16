class CreateDurations < ActiveRecord::Migration
  def change
    create_table :durations do |t|
      t.integer :loan_agreement_id

      t.timestamps
    end
  end
end
