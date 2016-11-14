class LogBook < ApplicationRecord
  belongs_to :pilot
  has_many :flights
end
