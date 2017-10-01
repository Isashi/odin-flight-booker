class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @booking.passengers.build
    end
    
    def create
        @booking = Booking.create(booking_params)
        if @booking.save 
            redirect_to @booking
        else 
            render :new
        end
    end
    
    def show
        @booking = Booking.find(params[:id])
    end
    
    private
        def booking_params
            params.required(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
        end
end