class RenameLocationCityToCityInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :location_city, :city
  end
end
