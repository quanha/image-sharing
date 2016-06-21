class Slide < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
