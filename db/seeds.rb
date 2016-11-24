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


20.times do
  pilot = Pilot.new(name: Faker::Name.name, email: Faker::Internet.free_email, age: rand(16..99), password: "testtest", password_confirmation: "testtest")
  3.times do
    pilot.ratings << Rating.order("RANDOM()").first
  end
  pilot.save
end

Pilot.all.each do |pilot|
  5.times do
    flight = pilot.flights.new(date: Date.today, duration: rand(45..450), notes: Faker::Lorem.sentences(3).join(" "), instructor: Faker::Name.name)
    flight.airplanes << Airplane.order("RANDOM()").first
    flight.flight_airplanes.first.tail_number = "N#{Faker::Number.number(6)}"
    flight.save
  end
end

end
