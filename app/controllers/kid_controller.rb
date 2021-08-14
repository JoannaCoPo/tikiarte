class KidController < ApplicationController
  def new
    @new_kid = Kid.new
  end

  def create
    kid = kid_params
    kid[:user_id] = current_user.id
    new_kid = Kid.new(kid)
    if new_kid.save
      flash[:alert] = "#{new_kid.first_name} has been added to your account!"
      redirect_to user_path
    else
      flash[:alert] = 'Unable to add kid to your account, please provide both first and last name.'
      redirect_to new_user_kid_path
    end
  end

  def show
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    @kid.images.attach(params[:images])
    # if @kid.images.attached?
    #   redirect_to user_kid_path(@kid.id)
    # end
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :image)
  end
end
