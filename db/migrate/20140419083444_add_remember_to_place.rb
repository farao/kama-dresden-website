class AddRememberToPlace < ActiveRecord::Migration
  def change
    add_column :places, :remember, :bool
  end
end
