class AddLatlongToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :latitude, :float
    add_column :destinations, :longitude, :float
    remove_column :destinations, :map, :text
  end
end
