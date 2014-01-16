class CreateFinePolicies < ActiveRecord::Migration
  def change
    create_table :fine_policies do |t|
      t.decimal :min
      t.decimal :max
      t.string :period

      t.timestamps
    end
  end
end
