class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.first_name}"
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    else
      flash[:error] = new_user.full_messages.join(', ')
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
