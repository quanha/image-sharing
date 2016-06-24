class Category < ActiveRecord::Base
  has_many :product_categories
  has_many :products, through: :product_categories

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
