class Plan < ApplicationRecord
  
  belongs_to :camp_site
  # belongs_to :user
  has_many :reservations
  
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  # validates :capacity, presence: true, numericality: { greater_than: 0 }
  validates :about, presence: true
  
end
