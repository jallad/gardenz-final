class ProfileController < ApplicationController
  before_action :require_user_logged_in!

  def edit

  end

  def show

  end

  def update
    if Current.user.update(profile_params)
      redirect_to root_path, notice: "Profile updated!"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end

end