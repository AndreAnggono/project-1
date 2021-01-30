class User < ApplicationRecord
  has_many :reviews
  validates :username, :uniqueness => true, :presence => true
  validates :email, :uniqueness => true, :presence => true
  has_secure_password

  def self.create_from_omniauth(auth)
    User.find_or_create_by(:uid => auth['uid'], :provider => auth['provider']) do |u|
      

      
      u.email = auth['info']['email'] ? auth['info']['email'] : "no@email.com"
      

      if u.provider == "google_oauth2"
        username = "#{auth['info']['first_name']}.#{auth['info']['last_name']}".downcase
  
        u.first_name = auth['info']['first_name']
        u.last_name = auth['info']['last_name']
        
      elsif u.provider == "github"
        username = auth['extra']['raw_info']['login'].downcase
        u.first_name = auth['info']['name']
      end

      user = User.where("username LIKE ?", "%#{username}%")
      username = "#{username}#{user.count + 1}" unless user.count.zero?
      u.username = username
      u.avatar = auth['info']['image']
      u.password = SecureRandom.hex(16)
    end
  end
end