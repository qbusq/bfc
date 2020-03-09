class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :company_certificates, dependent: :destroy
  has_many :offers, foreign_key: :from_user_id, dependent: :destroy
  has_many :products, dependent: :destroy
  validates :user_type, inclusion: { in: ['processor', 'food service', 'retail']}
end
