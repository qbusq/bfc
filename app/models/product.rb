class Product < ApplicationRecord
  belongs_to :user
  belongs_to :prod_category
  has_one_attached :photo
  validates :name, :weight_in_kg, :nr_per_sku, :user, :prod_category, presence: true
end
