class ProductCertificate < ApplicationRecord
  belongs_to :product
  belongs_to :certificate
  validates :product, :certificate, presence: true
end
