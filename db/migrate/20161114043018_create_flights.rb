class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.belongs_to :log_book, foreign_key: true
      t.string :tail_number
      t.string :origin
      t.string :destination
      t.string :instructor
      t.text :notes
      t.integer :duration, default: 0

      t.timestamps
    end
  end
end
