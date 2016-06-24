class ProductQuantity < ActiveRecord::Base
  validates :size,  numericality: { only_integer: true }
  validates :store_id,  numericality: { only_integer: true }
  validates :quantity,  numericality: { only_integer: true }
  belongs_to :product
end
