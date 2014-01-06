class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :subject_class
      t.string :subject_id
      t.string :role_id

      t.timestamps
    end
  end
end
