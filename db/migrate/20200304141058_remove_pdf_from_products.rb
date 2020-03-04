class RemovePdfFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :prod_specification_pdf
  end
end
