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

end
