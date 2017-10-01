class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :passengers
      t.references :flight

      t.timestamps null: false
    end
  end
end
