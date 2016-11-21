require 'pry'
class LogBook < ApplicationRecord
  include DisplayTime::InstanceMethods
  belongs_to :pilot
  has_many :flights

  def total_flight_time
    minutes = self.flights.sum(:duration)
    display_time(minutes)
  end
end
