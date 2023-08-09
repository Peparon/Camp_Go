class Reservation < ApplicationRecord
  
  belongs_to :user
  # belongs_to :camp_site
  belongs_to :plan
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :guests, presence: true, numericality: { greater_than: 0 }
  
end
