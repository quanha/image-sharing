class Store < ActiveRecord::Base
  validates :name, :presence => true
  validates :address, :presence => true
  validates :working_time, :presence => true

  has_many :product_quantities
end
