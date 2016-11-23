class Flight < ApplicationRecord
  include DisplayTime::InstanceMethods
  belongs_to :log_book
  has_many :flight_airplanes
  has_many :airplanes, through: :flight_airplanes
  delegate :pilot, to: :log_book
  validates :origin, presence: true
  accepts_nested_attributes_for :flight_airplanes
  attr_accessor :hours, :minutes

  def flight_airplanes_attributes=(flight_airplane)
    # raise flight_airplane.inspect
    self.flight_airplanes << FlightAirplane.find_or_create_by(flight_id: self.id)
    self.flight_airplanes.update(flight_airplane["0"])
  end

  def update_duration
    self.duration = hours.to_i*60 + minutes.to_i
  end

  def hours
    self.duration / 60
  end

  def minutes
    self.duration % 60
  end

  def time
    minutes = self.duration
    display_time(minutes)
  end

end
