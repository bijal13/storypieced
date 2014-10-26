class ProfilesController < ApplicationController

  before_action :get_user, only: [:show, :create, :edit, :update]
  before_action :get_profile, only: [:destroy]

  def index
    @profiles = Profiles.all
  end

  def new
    @user.profile = Profile.new(:id => @user.id)
  end

  def create
    @profile = @user.profile.create(params[:profile])
    if @profile.save
      flash[:notice] = 'Your profile was successfully created.'
      redirect_to(@profile)
    else
      flash[:notice] = 'Error. Something went wrong.'
      render :new
    end
  end

  def show
    render user_profile_path(@user)
  end

  def edit
    @user.build_profile if @user.profile.nil?
  end

  def update
    @user.build_profile if @user.profile.nil?
    if @user.profile.update_attributes(profile_params)
      flash[:notice] = 'Your profile was successfully updated.'
      redirect_to(edit_user_profile_path(@user))
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profile_url, notice: 'The profile was successfully deleted.'
  end

  def get_profile
    @profile = Profile.find(params[:profile_id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  private

  def profile_params
    params.require(:profile).permit([:name, :country, :bio])
  end
end