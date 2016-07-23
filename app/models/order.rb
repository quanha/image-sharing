class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products

  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true

end
