json.extract! hotel, :id, :name, :city, :description, :image_url, :number_of_rooms, :price, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
