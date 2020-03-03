class CreateProdCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :prod_categories do |t|
      t.string :name
      t.integer :gpc_brick
      t.string :brick_description

      t.timestamps
    end
  end
end
