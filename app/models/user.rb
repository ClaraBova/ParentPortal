class User < ActiveRecord::Base
   include BCrypt

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validate :password_present

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    return user if user && user.password == password
  end

  private
  def password_present
    errors.add(:password, "cannot be blank") if self.password == ""
  end

end
