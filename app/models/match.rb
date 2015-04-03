# A match is the top-level grouping of games
# A best-of-three is represented by 1 match and 3 games
class Match < ActiveRecord::Base
  has_many :games
  has_many :players
  has_many :users, through: :players

  def winner
    games_won = players.map { |p| [p.id, 0] }.to_h
    games.each do |g|
      if (winner = g.winner_id)
        games_won[winner] += 1
      end
    end

    players.find { |p| p.id == games_won.max_by { |participant_id, count| count }.first }
  end

end
