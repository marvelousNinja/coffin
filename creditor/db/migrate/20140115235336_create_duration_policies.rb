class CreateDurationPolicies < ActiveRecord::Migration
  def change
    create_table :duration_policies do |t|
      t.integer :min
      t.integer :max
      t.string :units

      t.integer :credit_product_id

      t.timestamps
    end
  end
end
