# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Airport.delete_all if Rails.env.development?
Flight.delete_all if Rails.env.development?
Passenger.delete_all if Rails.env.development?


Airport.create!(name: "San Francisco", code: "SFO")
Airport.create!(name: "Bergamo", code: "BGY")
Airport.create!(name: "Saigon", code: "SGN")

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

Passenger.create!(name: "Andy", email: "mindovermiles262")
Passenger.create!(name: "Isashi", email: "isashi@gmail.com")
Passenger.create!(name: "Linh", email: "lihn@gmail.com")

Booking.create!(
    flight: Flight.first,
    passengers: [Passenger.first]
)
    