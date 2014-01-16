class CreatePercentPolicies < ActiveRecord::Migration
  def change
    create_table :percent_policies do |t|
      t.decimal :min
      t.decimal :max
      t.boolean :fixed
      t.string :period

      t.integer :credit_product_id

      t.timestamps
    end
  end
end
