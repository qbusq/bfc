class AddProductToOfferLines < ActiveRecord::Migration[5.2]
  def change
    add_reference :offer_lines, :product, foreign_key: true
  end
end
