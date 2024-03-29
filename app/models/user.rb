class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
