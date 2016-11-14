class CreatePilots < ActiveRecord::Migration[5.0]
  def change
    create_table :pilots do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age

      t.timestamps
    end
  end
end
