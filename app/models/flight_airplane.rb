class FlightAirplane < ApplicationRecord
  belongs_to :flight
  belongs_to :airplane
  accepts_nested_attributes_for :airplane
end
