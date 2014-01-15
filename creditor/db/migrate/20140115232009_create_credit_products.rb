class CreateCreditProducts < ActiveRecord::Migration
  def change
    create_table :credit_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
