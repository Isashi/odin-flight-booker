class FlightsController < ApplicationController
    def index
        @departures = Flight.select(:departure_id).distinct.map{ |d| [d.departure.name, d.departure_id] }
        @arrivals = Flight.select(:arrival_id).distinct.map{ |d| [d.arrival.name, d.arrival_id] }
        @dates = Flight.select(:departure_time).map{ |f| f.departure_time.strftime("%b %d %Y") }
        
        @flights = Flight.where("departure_id = ? AND arrival_id = ?", params[:departure], params[:arrival])
    end
end
