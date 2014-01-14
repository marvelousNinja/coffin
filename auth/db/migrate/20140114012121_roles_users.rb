class RolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users, id: false, force: true do |t|
      t.integer :role_id
      t.integer :user_id
    end

    remove_column :roles, :user_id
  end
end
