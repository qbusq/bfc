class RemoveNameFromProdCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :prod_categories, :name
  end
end
