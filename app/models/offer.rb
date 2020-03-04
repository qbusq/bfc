class Offer < ApplicationRecord
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
  belongs_to :offer_request_id, class_name: 'Offer'
  belongs_to :follow_up_on_offer, class_name: 'Offer'
  has_many :offer_lines, dependent: :destroy
  validates :from_user, :date, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["requested", "sent", "pending", "accepted", "confirmed", "declined"] }
  has_one_attached :offer_attachment
end
