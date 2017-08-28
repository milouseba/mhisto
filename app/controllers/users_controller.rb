class UsersController < ApplicationController
  after_action :verify_authorized, :except => [:edit, :update, :show]

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    redirect_to answers_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :bio, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
