class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.decimal :min
      t.decimal :max

      t.string :period

      t.boolean :fixed

      t.string :type

      t.text :payment_methods, array: true
      t.boolean :allows_advanced_repayment

      t.timestamps
    end
  end
end
