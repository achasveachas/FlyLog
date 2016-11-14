class CreateLogBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :log_books do |t|
      t.belongs_to :pilot, foreign_key: true

      t.timestamps
    end
  end
end
