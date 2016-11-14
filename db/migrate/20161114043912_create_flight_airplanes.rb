class CreateFlightAirplanes < ActiveRecord::Migration[5.0]
  def change
    create_table :flight_airplanes do |t|
      t.belongs_to :flight, foreign_key: true
      t.belongs_to :airplane, foreign_key: true

      t.timestamps
    end
  end
end
