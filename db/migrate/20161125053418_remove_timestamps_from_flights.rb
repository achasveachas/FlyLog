class RemoveTimestampsFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :created_at, :string
    remove_column :flights, :updated_at, :string
    remove_column :pilots, :created_at, :string
    remove_column :pilots, :updated_at, :string
    remove_column :ratings, :created_at, :string
    remove_column :ratings, :updated_at, :string
    remove_column :pilot_ratings, :created_at, :string
    remove_column :pilot_ratings, :updated_at, :string
    remove_column :log_books, :created_at, :string
    remove_column :log_books, :updated_at, :string
  end
end
