class FlightsController < ApplicationController
    def index
        @departures = Flight.select(:departure_id).distinct.map{ |d| [d.departure.name, d.departure_id] }
        @arrivals = Flight.select(:arrival_id).distinct.map{ |d| [d.arrival.name, d.arrival_id] }
        # FORMAT MON day year (like Dec 15 2017)
        #@dates = Flight.select(:departure_time).map{ |f| f.departure_time.strftime("%b %d %Y") }
        
        #FORMAT year-month-day (like 2017-12-15)
        @dates = Flight.select(:departure_time).distinct.order("departure_time ASC").map{ |f| f.departure_time.strftime("%Y-%m-%d") }
        
        #SEACH BY DEPARTURE AND ARRIVAL
        #@flights = Flight.where("departure_id = ? AND arrival_id = ?", params[:departure], params[:arrival])
        
        #SEACH BY DEPARTURE, ARRIVAL, DEPARTURE TIME (NOT INTUITIVE SINCE YOU HAVE TO KNOW THE DEPARTURE DATE).
        #IT WORKS ONLY WITH year-month-day FORMAT
        @flights = Flight.where("departure_id = ? AND arrival_id = ? AND departure_time = ?", params[:departure], params[:arrival], params[:departure_time])
    end
end
