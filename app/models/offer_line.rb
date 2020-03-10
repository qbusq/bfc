class OfferLine < ApplicationRecord
  belongs_to :offer
  belongs_to :product
  belongs_to :target_offer_line, class_name: 'OfferLine', optional: true
  validates :offer, :product, :quantity_in_tons, presence: true

  def quantity_display
      "#{self.quantity_in_tons} tons"
  end

  def price_display
      "#{self.price} EUR/kg"
  end
end
