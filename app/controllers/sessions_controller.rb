class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now.notice = "Logged in!"
      respond_to do |format|
        format.js { render :redirect }
      end
    else
      flash.now.alert = "Invalid username or password"
      respond_to do |format|
        format.js # create.js.erb
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
