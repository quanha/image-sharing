class Menu < ActiveRecord::Base
  validates :name, :presence => true
  validates :url_code, presence: true
end
