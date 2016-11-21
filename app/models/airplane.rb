class Airplane < ApplicationRecord
  has_many :flight_airplanes
  has_many :flights, through: :flight_airplanes
end
