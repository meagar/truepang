# A match is the top-level grouping of games
# A best-of-three is represented by 1 match and 3 games
class Match < ActiveRecord::Base
  has_many :games
  has_many :players
  has_many :users, through: :players

  has_many :ratings, class_name: 'EloRating'

  scope :finished, -> { where('finished_at is not null') }

  def winner
    games_won = players.map { |p| [p.id, 0] }.to_h
    games.each do |g|
      if (winner = g.winner_id)
        games_won[winner] += 1
      end
    end
    players.find { |p| p.id == games_won.max_by { |participant_id, count| count }.first }
  end

  def apply_elo_ratings
    raise "Cannot apply elo ratings to an unfinished game" unless finished_at

    raise "Something wrong" unless players.length == 2

    players = self.players.order(:id).all

    elo_players = players.map do |player|
     if player.user.elo_rating.nil?
        player.user.elo_rating = 1000.0
        player.user.save!
      end
      {
        rating: player.user.elo_rating,
        games: player.user.matches.finished.where('finished_at < ?', finished_at).count,
        score: (winner == player ? 1.0: 0.0)
      }
    end

    u1 = players.first.user
    u2 = players.last.user

    game = EloGame.new(*elo_players)

    rating1 = ratings.build(user: u1)
    rating1.in = game.rating1_in
    rating1.out = u1.elo_rating = game.rating1_out

    rating2 = ratings.build(user: u2)
    rating2.in = game.rating2_in
    rating2.out = u2.elo_rating = game.rating2_out

    rating1.save!
    rating2.save!
    u1.save!
    u2.save!
    save!
  end


end
