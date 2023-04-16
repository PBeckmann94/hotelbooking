class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :city
      t.text :description
      t.string :image_url
      t.integer :number_of_rooms
      t.decimal :price

      t.timestamps
    end
  end
end
