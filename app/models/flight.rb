class Flight < ApplicationRecord
  belongs_to :log_book
  has_many :flight_airplanes
  has_many :airplanes, through: :flight_airplanes
  validates :origin, presence: true
end
