class EloRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates :in, :out, presence: true

  def self.for(user)
    self.where(user_id: user.id).first
  end

  def self.recalculate_elo_ratings
    User.transaction do
      EloRating.destroy_all
      User.update_all(elo_rating: nil)
      Match.finished.order('finished_at').each(&:apply_elo_ratings)
    end
  end

end
