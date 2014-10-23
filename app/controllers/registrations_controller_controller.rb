class RegistrationsControllerController < Devise:: RegistrationsController
after_filter: create

  def after_create
  user.profile = Profile.new
  user.save
  end

end
