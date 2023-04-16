class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.string :hotel_id
      t.string :city
      t.datetime :arrival_date
      t.datetime :departure_date
      t.integer :number_of_rooms
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end
  end
end
