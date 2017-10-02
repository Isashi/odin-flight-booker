class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :flight_number
      t.integer :passengers
      t.datetime  :departure_time
      t.references :departure, index: true, foreign_key: true
      t.references :arrival, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
