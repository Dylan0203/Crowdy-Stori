class ApiV1::UserProfilesController < ApiController

  before_action :authenticate_user!, :except => [:show]

  def show
    @user = User.find(params[:id])
    @profile = @user.get_profile
  end

  def update
    @user = current_user
    @profile = @user.get_profile
    @profile.update(profile_params)

    if @profile.save
      render :json => { :User_id => @user.id, :message => "OK" }
    else
      render :json => { :User_id => @user.id, :message => "Failed" }
    end
  end

  protected

  def profile_params
    params.permit(:username,
                  :picture,
                  :gender,
                  :birthday,
                  :bloodtype,
                  :interest,
                  :about_me,
                  :voice)
  end

end