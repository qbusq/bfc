class AddTargetOfferLineIdToOfferLines < ActiveRecord::Migration[5.2]
  def change
    add_column :offer_lines, :target_offer_line_id, :integer
  end
end
