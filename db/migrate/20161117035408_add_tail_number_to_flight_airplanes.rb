class AddTailNumberToFlightAirplanes < ActiveRecord::Migration[5.0]
  def change
    add_column :flight_airplanes, :tail_number, :string
  end
end
