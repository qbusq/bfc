class ProdCategory < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :gpc_brick, :brick_description, presence: true
end
