class Game < ActiveRecord::Base
  belongs_to :match

  has_many :scores, class_name: 'GameScore'

  validates :match, presence: true

  def self.for_winner(winner)
    return []#all.select { |g| g.winner == winner }
  end

  def winner_id
    return nil if scores.length == 0
    scores.max_by { |s| s.score }.player_id
  end

  def score_for(player)
    scores.find { |s| s.player_id == player.id }.try(:score)
  end

end
