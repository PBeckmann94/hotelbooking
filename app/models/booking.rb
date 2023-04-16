class Booking < ApplicationRecord
    validates :first_name, :last_name, :phone, :email, :arrival_date, :departure_date, presence: true
end

