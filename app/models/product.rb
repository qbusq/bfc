class Product < ApplicationRecord
  belongs_to :user
  belongs_to :prod_category
  validates :name, :weight_in_kg, :nr_per_sku, presence: true
end
