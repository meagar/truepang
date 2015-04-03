# A match is the top-level grouping of games
# A best-of-three is represented by 1 match and 3 games
class Match < ActiveRecord::Base
  has_many :games
  has_many :players, through: :games
  has_many :users, through: :players
end
