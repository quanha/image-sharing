class Product < ActiveRecord::Base
  has_many :pictures
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_quantities, dependent: :destroy
  belongs_to :product_type
  has_many :order_products
  accepts_nested_attributes_for :product_quantities, allow_destroy: true,
                                reject_if: proc { |p| p['quantity'].blank? || p['size'].blank? || p['store_id'].blank?}

  validates :name, :presence => true
  validates :description, :presence => true
  validates :detail, :presence => true
  validates :price, :presence => true
  validates :code, :presence => true
  validates :supplier_id, :presence => true
  validates :category_ids, :presence => { :message => '^Please select category' }
  validates_numericality_of :price,  :greater_than => 0
  validates_numericality_of :sale_price, :greater_than_or_equal_to => 0
  has_attached_file :image, styles: { medium: "252x300>", thumb: "100x100>" }
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
