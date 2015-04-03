
class MatchesController < ApplicationController

  def index
    @matches = Match.order('finished_at desc').includes(games: :scores, players: :user).all
  end

end
