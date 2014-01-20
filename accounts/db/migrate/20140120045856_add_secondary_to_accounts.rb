class AddSecondaryToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :secondary, :boolean, default: false
  end
end
