class User < ApplicationRecord
  has_many :reviews
  validates :username, :uniqueness => true, :presence => true
  validates :email, :uniqueness => true, :presence => true
  has_secure_password

  def self.create_from_omniauth(auth)
    User.find_or_create_by(:uid => auth['uid'], :provider => auth['provider']) do |u|
      username = "#{auth['info']['first_name']}.#{auth['info']['last_name']}".downcase
      user = User.where("username LIKE ?", "%#{username}%")
      username = "#{username}#{user.count + 1}" unless user.count.zero?
      u.username = username
      u.first_name = auth['info']['first_name']
      u.last_name = auth['info']['last_name'] 
      u.email = auth['info']['email']
      u.avatar = auth['info']['image']
      u.password = SecureRandom.hex(16)
    end
  end
end