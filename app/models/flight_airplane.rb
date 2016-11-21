class FlightAirplane < ApplicationRecord
  belongs_to :flight
  belongs_to :airplane
  accepts_nested_attributes_for :airplane

  def airplane_attributes=(airplane)
    self.airplane = Airplane.find_or_create_by(make: airplane[:make], model: airplane[:model])
    self.airplane.update(airplane)
  end
end
