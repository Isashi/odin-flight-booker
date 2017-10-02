# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Airport.delete_all if Rails.env.development?
Flight.delete_all if Rails.env.development?
Passenger.delete_all if Rails.env.development?


Airport.create!(name: "San Francisco", code: "SFO")
Airport.create!(name: "Bergamo", code: "BGY")
Airport.create!(name: "Saigon", code: "SGN")
Airport.create!(name: "Atlanta", code: "ATL")
Airport.create!(name: "Beijing", code: "PEK")
Airport.create!(name: "Dubai", code: "DXB")
Airport.create!(name: "Los Angeles", code: "LAX")
Airport.create!(name: "Hong Kong", code: "HKG")
Airport.create!(name: "Paris", code: "CDG")
Airport.create!(name: "Amsterdam", code: "AMS")
Airport.create!(name: "Frankfurt", code: "FRA")

Flight.create!(
    flight_number: 1, 
    passengers: 300, 
    departure_time: "12/10/2017",
    departure: Airport.first, 
    arrival: Airport.last
)
Flight.create!(
    flight_number: 2, 
    passengers: 300, 
    departure_time: "09/10/2017",
    departure: Airport.second, 
    arrival: Airport.last
)

airports = Airport.all

airports.each do |from|
  airports.each do |to|
    4.times do
      Flight.create!(
          flight_number: 4.times.map{rand(10)}.join,
          passengers: 300,
          departure:from,
          arrival:to,
          departure_time:(Time.now + rand(200).days+ rand(100000))) unless from == to
    end
  end
end

Passenger.create!(name: "Andy", email: "mindovermiles262")
Passenger.create!(name: "Isashi", email: "isashi@gmail.com")
Passenger.create!(name: "Linh", email: "lihn@gmail.com")

Booking.create!(
    flight: Flight.first,
    passengers: [Passenger.first]
)
    