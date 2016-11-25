class RemoveTimestampsFromAirplanes < ActiveRecord::Migration[5.0]
  def change
    remove_column :airplanes, :created_at, :string
    remove_column :airplanes, :updated_at, :string
  end
end
