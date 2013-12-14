class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Invalid name or password' 
    end
  end 

  def destroy
    session[:user_id] = nil
    redirect_to teams_url, notice: 'You login out'
  end
end
