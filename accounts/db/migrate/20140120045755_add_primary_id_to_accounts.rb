class AddPrimaryIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :primary_id, :integer
  end
end
