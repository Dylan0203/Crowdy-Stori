class Profile < ActiveRecord::Base
  belongs_to :user 
  validates :username, uniqueness: true, allow_nil: true
end
