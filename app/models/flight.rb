class Flight < ApplicationRecord
  include DisplayTime::InstanceMethods
  belongs_to :log_book
  has_one :flight_airplane
  has_one :airplane, through: :flight_airplane
  delegate :pilot, to: :log_book
  validates :origin, presence: true
  accepts_nested_attributes_for :flight_airplane
  attr_accessor :hours, :minutes

  def flight_airplane_attributes=(flight_airplane)
    self.flight_airplane = FlightAirplane.find_or_create_by(flight_id: self.id)
    self.flight_airplane.update(flight_airplane)
  end

  def update_duration(hours, minutes)
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
