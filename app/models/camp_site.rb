class CampSite < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :reservations, through: :plans
  has_many :users, through: :reservations
  has_many :plans
  
  has_one_attached :image
  
  validates :name, :post_code, :address, :phone_number, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
