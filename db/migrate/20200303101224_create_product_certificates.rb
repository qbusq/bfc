class CreateProductCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :product_certificates do |t|
      t.references :certificate
      t.references :product

      t.timestamps
    end
  end
end
