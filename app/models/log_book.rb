require 'pry'
class LogBook < ApplicationRecord
  belongs_to :pilot
  has_many :flights

  def total_flight_time
    minutes = self.flights.size > 0 ? self.flights.sum(:duration) : 0
    hours = 0
    until minutes < 60
      minutes -= 60
      hours += 1
    end
    "#{hours}:#{minutes.to_s.rjust(2, "0")}"
  end
end
