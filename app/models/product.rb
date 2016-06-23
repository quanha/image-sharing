class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :detail, :presence => true
  validates :price, :presence => true
  validates :code, :presence => true
  validates :supplier_id, :presence => true
  validates :category_id, :presence => true
  validates_numericality_of :price,  :greater_than => 0
  validates_numericality_of :sale_price, :greater_than_or_equal_to => 0
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
