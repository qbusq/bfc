class ProdCategory < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, :gpc_brick, presence: true
end
