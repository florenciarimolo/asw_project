class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    #@current_user ||= User.find_by(username: cookies.encrypted[:user_username])
    @current_user ||= User.find_by(username: session[:user_username])
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
  end

  def check_auth
    if not current_user
      permission_denied
    end
  end

  helper_method :current_user
end
