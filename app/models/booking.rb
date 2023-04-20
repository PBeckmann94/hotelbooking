class Booking < ApplicationRecord
    belongs_to :hotel
    validates :first_name, :last_name, :phone, :email, :arrival_date, :departure_date, presence: true
    validates :arrival_date, presence: true
    validates :departure_date, presence: true
  
  end

