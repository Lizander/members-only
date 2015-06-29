class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_create :create_remember_token
  has_secure_password
  has_many :posts

  # Returns the hash digest of the given string
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # Return a random token.
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  private
    # Remembers a user in the database for use in persisten sessions.
  	def create_remember_token
  		self.remember_token = User.digest(User.new_remember_token)
  	end
end
