class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :comments, dependent: :destroy
end
