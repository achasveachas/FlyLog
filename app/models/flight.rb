class Flight < ApplicationRecord
  belongs_to :log_book
  has_many :flight_airplanes
  has_many :airplanes, through: :flight_airplanes
  delegate :pilot, to: :log_book
  validates :origin, presence: true
  accepts_nested_attributes_for :flight_airplanes
  attr_accessor :hours, :minutes
  before_save :update_duration

  def update_duration
    binding.pry
    self.duration += hours.to_i*60 + minutes.to_i
  end

  def display_time
    minutes = self.duration
    hours = 0
    until minutes < 60
      minutes -= 60
      hours += 1
    end
    "#{hours}:#{minutes.to_s.rjust(2, "0")}"
  end

end
