class Review < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :destination, :optional => true
  validates :rating, :presence => true
  validates :date_of_experience, :presence => true
  validates :description, :presence => true
end
