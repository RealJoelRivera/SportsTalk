class User < ApplicationRecord
  has_many :posts
  has_many :sports, through: :posts
  has_many :comments

  validates :name, presence: true
  validates :password_digest, presence: true

end
