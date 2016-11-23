class Airplane < ApplicationRecord
  has_many :flight_airplanes
  has_many :flights, through: :flight_airplanes

  def make_model
    "#{self.make} - #{self.model}"
  end
end
