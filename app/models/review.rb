class Review < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :destination, :optional => true
end
