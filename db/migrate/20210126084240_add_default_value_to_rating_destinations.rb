class AddDefaultValueToRatingDestinations < ActiveRecord::Migration[5.2]
  def change
    change_column_default :destinations, :rating, 0.0
  end
end
