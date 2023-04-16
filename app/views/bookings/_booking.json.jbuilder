json.extract! booking, :id, :first_name, :last_name, :phone, :email, :hotel_id, :arrival_date, :departure_date, :number_of_rooms, :price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
