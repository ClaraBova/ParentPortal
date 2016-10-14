class User < ActiveRecord::Base
   include BCrypt
   belongs_to :location

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :user_type, presence: true
  validates :location_id, presence: true
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
