class Chapter < ActiveRecord::Base
  validates_presence_of :topic, :content

  has_ancestry :cache_depth => true
  belongs_to :user
  belongs_to :category

  mount_uploader :avatar, AvatarUploader
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars
end