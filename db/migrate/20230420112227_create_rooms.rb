class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.datetime :arrival_date
      t.datetime :departure_date

      t.timestamps
    end
  end
end
