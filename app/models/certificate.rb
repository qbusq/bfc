class Certificate < ApplicationRecord
  has_many :company_certificates, dependent: :destroy
  has_many :product_certificates, dependent: :destroy
  validates :name, presence: true
end
