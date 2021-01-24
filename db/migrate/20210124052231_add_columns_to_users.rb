class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location_city, :text
    add_column :users, :kudos, :integer
  end
end
