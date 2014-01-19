class AddStatusToCreditProduct < ActiveRecord::Migration
  def change
    add_column :credit_products, :status, :string
  end
end
