class AddAdminToPilots < ActiveRecord::Migration[5.0]
  def change
    add_column :pilots, :admin, :boolean, default: false
  end
end
