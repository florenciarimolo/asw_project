class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      cookies.encrypted[:user_username] = { :value => @user.username, :expires => 2.weeks.from_now }
      flash[:success] = "Welcome, #{@user.full_name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
    #render :plain => "<pre>#{request.env["omniauth.auth"].to_yaml}</pre>" # quick and dirty
  end
  def destroy
    if current_user
      cookies.delete :user_username
      flash[:success] = "Sucessfully logged out!"
    end
    redirect_to root_path
  end
end
