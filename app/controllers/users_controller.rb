class UsersController < ApplicationController

  @user.update_attributes(params[:user].permit(:role_ids))

  def index
  end

  def new
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
end
