class JoinCreditProductsAndPolicies < ActiveRecord::Migration
  def change
    create_join_table :credit_products, :policies do |t|
    end
  end
end
