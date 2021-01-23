class AddFirstNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    remove_column :users, :name, :text
  end
end