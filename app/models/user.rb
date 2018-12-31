class User < ApplicationRecord
  has_many :posts
  has_many :sports, through: :posts
  has_many :comments

  validates :name, presence: true
  validates :password_digest, presence: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password_digest) == password
  end

end
