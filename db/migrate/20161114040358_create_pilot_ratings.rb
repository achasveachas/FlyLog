class CreatePilotRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :pilot_ratings do |t|
      t.belongs_to :pilot, foreign_key: true
      t.belongs_to :rating, foreign_key: true

      t.timestamps
    end
  end
end
