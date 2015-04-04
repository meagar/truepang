class Game < ActiveRecord::Base
  belongs_to :match

  has_many :scores, class_name: 'GameScore'

  validates :match, presence: true

  scope :finished, -> { where('finished_at is not null') }

  def winner_id
    scores.max_by { |s| s.score }.try(:player_id)
  end

  def score_for(player)
    scores.find { |s| s.player_id == player.id }.try(:score)
  end

end
