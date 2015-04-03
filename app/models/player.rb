# Player joins a user to a game.
# It is where the scoring for a given game is stored
class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :user, :game, presence: true
end
