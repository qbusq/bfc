class ChangeTargetOfferLineToBeBigintInOfferLines < ActiveRecord::Migration[5.2]
  def change
    change_column :offer_lines, :target_offer_line_id, :bigint, index: true
  end
end
