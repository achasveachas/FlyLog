module PilotsHelper
  def display_ratings(pilot)
    rating_array = []
    pilot.ratings.each do |rating|
      rating_array << rating.rating
    end
    rating_array.join(", ")
  end
end
