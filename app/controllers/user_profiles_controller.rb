class UserProfilesController < ApplicationController

  def show
    
   @user = User.find(params[:user_id])
   @profile = @user.profile

#   if @profile
#     @profile = @user.profile
#   else
#     @user.profile = Profile.create
#   end
 
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

def update

    @user = current_user

    @profile = @user.profile
    @profile.update(profile_params)

    redirect_to user_profile_path(@user)
  end

  protected

  def profile_params
    params.require(:profile).permit(:username,:gender,:birthday,:bloodtype,:about_me, :voice)
  end

end
