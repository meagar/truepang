
class GamesController < ApplicationController

  def index
    @games = Game.order('created_at desc').includes(:players => :user).all
  end

  def new
    @game = Game.new
  end

  def create
  end

end
