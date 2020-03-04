class ChangeFullTruckPricePerKgToOfferLines < ActiveRecord::Migration[5.2]
  def change
    rename_column :offer_lines, :full_truck_price_per_kg, :price
  end
end
