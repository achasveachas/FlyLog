class PilotRating < ApplicationRecord
  belongs_to :pilot
  belongs_to :rating
end
