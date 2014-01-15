class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :field
      t.string :value

      t.integer :permission_id

      t.timestamps
    end
  end
end
