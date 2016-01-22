class UserProfilesController < ApplicationController

  before_action :authenticate_user!, :except => [:show]

  def show
    
   @user = User.find(params[:user_id])
   @profile = @user.profile

   unless @profile
     @user.profile = Profile.create
   end
 
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

def update

    @user = current_user

    @profile = @user.profile
    @profile.update(profile_params)

    if @profile.save
      flash[:notice] = "使用者資料更新成功"
    else
      flash[:alert] = "使用者名稱已被使用過"
    end


    redirect_to user_profile_path(@user)
  end

  protected

  def profile_params
    params.require(:profile).permit(:username,:gender,:birthday,:bloodtype,:about_me, :voice)
  end

end
