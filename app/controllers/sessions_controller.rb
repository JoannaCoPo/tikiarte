class SessionsController < ApplicationController
  def new; end

  def create
    found_user = User.find_by(email: params[:email])
    if found_user && found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      flash[:alert] = "Welcome back, #{found_user.first_name}!"
      redirect_to user_path
    else
      flash[:alert] = 'Your username or password are incorrect. Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
