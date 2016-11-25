class RemoveTimestampsFromFlightAirplanes < ActiveRecord::Migration[5.0]
  def change
    remove_column :flight_airplanes, :created_at, :string
    remove_column :flight_airplanes, :updated_at, :string
  end
end
