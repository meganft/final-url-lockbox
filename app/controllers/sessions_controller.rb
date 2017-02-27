class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Successfully logged in!"
      session[:user_id] = user.id
      redirect_to links_path
    else
      flash[:danger] = "Something went wrong. Please try again."
      redirect_to :login
    end
  end

  def destroy
    flash[:success] = "Successfully logged out."
    session[:user_id] = nil
    redirect_to :login
  end

end
