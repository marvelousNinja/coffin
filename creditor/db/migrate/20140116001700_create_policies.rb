class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.decimal :min, default: 0
      t.decimal :max, default: 0

      t.string :period

      t.boolean :fixed, default: false

      t.string :type

      t.text :payment_methods, array: true, default: []
      t.boolean :allows_advanced_repayment

      t.timestamps
    end
  end
end
