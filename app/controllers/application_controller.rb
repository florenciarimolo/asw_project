class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(username: session[:user_username])
  end

  helper_method :current_user
end
