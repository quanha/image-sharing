class ProductQuantity < ActiveRecord::Base
  validates :size,  numericality: { only_integer: true }
  validates :store_id,  numericality: { only_integer: true }
  validates :quantity,  numericality: { only_integer: true }
  belongs_to :product
  belongs_to :store

  def get_quantity(product_id)
    ProductQuantity.where(product_id: product_id).sum(:quantity)
  end
end
