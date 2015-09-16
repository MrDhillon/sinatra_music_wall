class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :track
  validate :already_voted

  private

  def already_voted
    unless Vote.where(user_id: user_id, track_id: track_id) == []
      errors.add(:vote, "User has voted")
    end
  end

end