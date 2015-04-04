
class UsersController < ApplicationController
  def index
    @users = User.active.order('elo_rating desc').all
  end

  def show
    @users = User.active.order('elo_rating desc').all
    @user = User.active.includes(:players, :matches).find(params[:id])

    @matches = @user.matches.order('finished_at desc').all

    @wins = @matches.select { |m| m.winner.user_id == @user.id }
    @losses = @matches.select { |m| m.winner.user_id != @user.id }

  end

end
