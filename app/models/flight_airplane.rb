class FlightAirplane < ApplicationRecord
  belongs_to :flight
  belongs_to :airplane
end
