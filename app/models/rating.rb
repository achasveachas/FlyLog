class Rating < ApplicationRecord
  has_many :pilot_ratings
  has_many :pilots, through: :pilot_ratings
end
