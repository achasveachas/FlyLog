class RemoveTailNumberFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :tail_number, :string
  end
end
