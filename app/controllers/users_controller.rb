class UsersController < ApplicationController

 before_action :get_user, only: [:show, :edit, :update]
  #user.update_attributes(params.require[:user].permit(:role_ids))

  def index
    @users = User.all
  end

  def new
    @user = User.new(user_params)
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_user
    @user = User.find(params[:profile_id])
  end

  def user_params
    params.require(:user).permit([:role_ids])
  end

end
