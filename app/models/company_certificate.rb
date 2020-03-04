class CompanyCertificate < ApplicationRecord
  belongs_to :user
  belongs_to :certificate
  validates :user, :certificate, presence: true
end
