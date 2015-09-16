class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :track
  validate :already_reviewed

  private

  def already_reviewed
    unless Review.where(user_id: user_id, track_id: track_id) == []
      errors.add(:vote, "User has reviewed")
    end
  end

end