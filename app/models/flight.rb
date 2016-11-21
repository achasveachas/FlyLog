class Flight < ApplicationRecord
  belongs_to :log_book
  has_many :flight_airplanes
  has_many :airplanes, through: :flight_airplanes
  delegate :pilot, to: :log_book
  validates :origin, presence: true
  accepts_nested_attributes_for :flight_airplanes

end
