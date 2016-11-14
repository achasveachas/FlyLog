class CreateAirplanes < ActiveRecord::Migration[5.0]
  def change
    create_table :airplanes do |t|
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end
