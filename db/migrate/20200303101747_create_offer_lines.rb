class CreateOfferLines < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_lines do |t|
      t.float :quantity_in_tons
      t.boolean :alternative_to_target
      t.float :full_truck_price_per_kg

      t.timestamps
    end
  end
end
