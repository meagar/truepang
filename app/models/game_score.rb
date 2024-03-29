class GameScore < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  validates :game, :player, presence: true

  validates :score, presence: true
end
