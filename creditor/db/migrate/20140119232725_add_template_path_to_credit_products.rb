class AddTemplatePathToCreditProducts < ActiveRecord::Migration
  def change
    add_column :credit_products, :template_path, :string
  end
end
