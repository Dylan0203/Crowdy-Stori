class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  ROLE_ADMIN = 'admin'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chapters

  def short_email
  self.email.split("@").first
  end

  def admin?
    self.role == ROLE_ADMIN
  end

  def display_name
    #first_name || 
    short_email || email
  end
end
