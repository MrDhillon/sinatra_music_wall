class Track < ActiveRecord::Base
  has_many :votes
  has_many :reviews
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
end