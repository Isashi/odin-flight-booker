class Flight < ActiveRecord::Base
  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"
  
  validates :flight_number, presence: true
  validates :departure, presence: true
  validates :arrival, presence: true
  validates :passengers, presence: true
end
