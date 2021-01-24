class ChangeDefaultValueKudos1InUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :avatar, "profile/profile.jpg"
  end
end
