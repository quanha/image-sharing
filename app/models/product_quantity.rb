class ProductQuantity < ActiveRecord::Base
  validates :size,  numericality: { only_integer: true }
  validates :store_id,  numericality: { only_integer: true }
  validates :quantity,  numericality: { only_integer: true }
  belongs_to :product
  belongs_to :store

  def self.get_quantity(product_id, size)
    ProductQuantity.where(product_id: product_id, size: size).sum(:quantity)
  end

  def self.subtract_quantity(product_id, size, subtracting_quantity)
    subtracting = subtracting_quantity.to_i
    product_quantities = ProductQuantity.where(product_id: product_id, size: size).order(quantity: :desc)
    product_quantities.each do |item|
      if subtracting >= item.quantity
        subtracting = subtracting - item.quantity
        item.update_quantity(item.quantity)
      else
        item.update_quantity(subtracting)
        break
      end
    end
  end

  def update_quantity(quantity)
    self.update(quantity: self.quantity - quantity)
  end

end
