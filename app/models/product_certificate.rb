class ProductCertificate < ApplicationRecord
  belongs_to :product
  belongs_to :certificate
end
