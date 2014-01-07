class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :subject
      t.boolean :owning_required
      t.integer :subject_id
      t.integer :role_id

      t.timestamps
    end
  end
end
