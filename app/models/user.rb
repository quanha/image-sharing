class User < ActiveRecord::Base
  extend Enumerize

  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  enumerize :role, in: [:user, :manager, :admin], default: :user

  def update_check_password params
    params[:password].blank? ? self.update_without_password(params) : self.update(params)
  end

  def full_name
    self.first_name+' '+self.last_name
  end
end
