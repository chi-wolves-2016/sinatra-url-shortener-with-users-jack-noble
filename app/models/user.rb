class User < ActiveRecord::Base
  has_many :urls

  validates_presence_of :username, :email, :password
  validates :email, uniqueness: true
  validate :validate_password

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @plaintext = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(sign_in_password)
    if password == sign_in_password
      return true
    end
  end

  def validate_password
    if @plaintext.length < 6
      errors.add(:password, "must be longer than 6 characters")
    elsif @plaintext == ''
      errors.add(:password, "cannot be blank")
    end
  end
end
