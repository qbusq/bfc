class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :company_certificates, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :products, dependent: :destroy
  validates :user_type, inclusion: { in: ['processor', 'food service', 'retail']}
end
