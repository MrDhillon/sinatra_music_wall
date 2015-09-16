class User < ActiveRecord::Base
  has_many :tracks
  has_many :votes
  has_many :reviews
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
end