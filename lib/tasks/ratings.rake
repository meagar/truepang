namespace :ratings do
  desc 'Recompute Elo ratings for all players, from the beginning of time'
  task :recalc => :environment do
    EloRating.recalculate_elo_ratings
  end
end
