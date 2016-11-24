# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ratings = ["Student", "Sport", "PPL", "PPL - Instrument", "CPL", "CPL - Instrument", "CPL - AMEL", "CFI", "CFII", "MEI", "ATP"]

ratings.each do |rating|
  Rating.create(rating: rating)
end

Airplane.create(make: "Cessna", model: "C172")
Airplane.create(make: "Piper", model: "Cherokee")
Airplane.create(make: "Boing", model: "747-8")
Airplane.create(make: "Airbus", model: "A380")
