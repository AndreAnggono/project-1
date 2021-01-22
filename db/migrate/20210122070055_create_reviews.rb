class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :description
      t.date :date_of_experience
      t.float :rating
      t.integer :user_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
