class UsersController < ApplicationController
  def show
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      authorize @new_user
      flash[:alert] = "Welcome #{@new_user.first_name}!"
      redirect_to user_path
    else
      flash[:alert] = 'User account not created, please try again.'
      redirect_to new_register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
