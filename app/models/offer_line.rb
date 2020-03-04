class OfferLine < ApplicationRecord
  belongs_to :offer
  belongs_to :product
  belongs_to :target_offer_line_id, class_name: 'OfferLine'
  validates :offer, :product, :quantity_in_tons, presence: true
end
