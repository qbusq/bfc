class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :brand
      t.references :prod_category
      t.references :user
      t.boolean :private_label
      t.float :weight_in_kg
      t.integer :nr_per_sku
      t.string :prod_specification_pdf

      t.timestamps
    end
  end
end
