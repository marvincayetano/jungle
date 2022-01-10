class User < ActiveRecord::Base
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)

    # @user = User.find_by(email: email.strip, password_digest: password.strip)
    @user = User.where("lower(email) = ?", email.strip.downcase).where("password_digest = ?", password).first

    return @user
  end
end
