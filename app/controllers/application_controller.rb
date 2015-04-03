class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_user

  helper_method :current_user, :logged_in?
  protected

  def require_user
    raise AuthorizationError, 'no user' unless current_user
  end

  def logged_in?
    @current_user.present?
  end

  def current_user
    @current_user ||= User.first#find(session[:user_id])
  end
end
