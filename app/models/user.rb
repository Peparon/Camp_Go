class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :plans
  has_many :reservations, dependent: :destroy
  # has_many :camp_sites, through: :reservations
  
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, presence: true
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
