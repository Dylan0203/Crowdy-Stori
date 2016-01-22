class Chapter < ActiveRecord::Base
  validates_presence_of :topic, :content

  has_ancestry :cache_depth => true
  belongs_to :user
  belongs_to :category

  mount_uploader :avatar, AvatarUploader
  #serialize :avatar

  def image_urls
    self.content.scan(/src=["|'](.*?)["|']/).flatten
  end
end