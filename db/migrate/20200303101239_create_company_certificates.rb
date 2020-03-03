class CreateCompanyCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :company_certificates do |t|
      t.references :user
      t.references :certificate

      t.timestamps

    end
  end
end
