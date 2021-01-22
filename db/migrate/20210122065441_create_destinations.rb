class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.text :name
      t.text :address
      t.text :overview
      t.text :contact
      t.text :website
      t.text :map
      t.float :rating

      t.timestamps
    end
  end
end
