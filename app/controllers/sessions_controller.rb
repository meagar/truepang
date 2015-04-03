
class SessionsController < ApplicationController

  skip_before_filter :require_user

  def login
  end

  # GET /login
  def logout
    reset_session
    redirect_to root_url
  end

  # GET auth/500px/callback
  def create
    begin
      user = User.find_or_create_from_auth_hash(auth_hash)
    rescue User::AuthorizationError
      redirect_to unauthorized_path
      return
    end

    session[:user_id] = user.id

    redirect_to games_path
  end

  def unauthorized
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

