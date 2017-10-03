class Flight < ActiveRecord::Base
  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"
  
  validates :flight_number, presence: true
  validates :departure, presence: true
  validates :arrival, presence: true
  validates :passengers, presence: true
  
  def self.date_list
    date = Flight.all.order(departure_time: :asc)
    date.map { |f| f.departure_time.strftime("%b %d %Y") }.uniq
  end
  
  #Andy Code
  def self.lookup(departure, arrival, day)
    Flight.where(departure_id: departure,
                 arrival_id: arrival,
                 departure_time: day_range(day))
  end

  private
  
  #Andy Code
  def self.day_range(date)
    unless date.nil?
      date = date.to_date
      date.beginning_of_day..date.end_of_day
    end
  end
end
