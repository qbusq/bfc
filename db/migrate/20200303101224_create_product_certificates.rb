class CreateProductCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :product_certificates do |t|

      t.timestamps
    end
  end
end
