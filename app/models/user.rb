class User < ActiveRecord::Base
  validates :name, :email, :password_hash, presence: true
  validates :email, uniqueness: true

  has_many :horses, foreign_key: "owner_id"

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user && user.password == password
  end

end
