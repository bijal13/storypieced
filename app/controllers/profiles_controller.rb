class ProfilesController < ApplicationController
before_action :get_profile, only: [:show, :edit, :update, :destroy]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      flash[:success] = "Your profile has been saved successfully."
    redirect_to @profile
    else
      render :new
    end
  end

  def edit
  @profile = user.profile
  end

  def update
      if @profile.update(profile_params)
        redirect_to @profile, notice: 'The profile was successfully updated.' }
        render :show, status: :ok, location: @profile}
      else
       render :edit
      end
  end


  def destroy
    @profile.destroy
      redirect_to profile_url, notice: 'The profile was successfully deleted.'
    end
  end

  private

  def get_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit([:name, :country, :bio])
  end

end
