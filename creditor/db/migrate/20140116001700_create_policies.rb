class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.decimal :min
      t.decimal :max

      t.string :period
      t.string :units

      t.boolean :fixed

      t.string :type

      t.timestamps
    end
  end
end
