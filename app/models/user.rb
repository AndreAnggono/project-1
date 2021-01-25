class User < ApplicationRecord
  has_many :reviews
  validates :username, :uniqueness => true, :presence => true
  validates :email, :uniqueness => true, :presence => true
  has_secure_password
end
