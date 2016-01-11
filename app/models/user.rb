class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  ROLE_ADMIN = 'admin'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :chapters
  has_one :profile, :dependent => :destroy

  def get_profile
    if self.profile
      return self.profile    
    else
       p = Profile.new
       p.user = self
       p.save
      return self.create_profile
    end
  end

  def get_fb_data
    j = RestClient.get "https://graph.facebook.com/v2.5/me", :params => { :access_token => self.fb_token, :fields => "id,name,email,picture" }
    JSON.parse(j)
  end


  def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        unless user.profile
          user.profile = Profile.create
        end
        user.profile.picture = auth.info.image
        #user.fb_raw_data = auth
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.get_profile
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       #existing_user.fb_raw_data = auth
       existing_user.profile.picture = auth.info.image
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.get_profile
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.profile.picture = auth.info.image
     user.password = Devise.friendly_token[0,20]
     #user.fb_raw_data = auth
     user.save!
     return user
  end

  def short_email
  self.email.split("@").first
  end

  def admin?
    self.role == ROLE_ADMIN
  end

  def display_name
    self.profile.try(:username) || short_email || email
  end
end
