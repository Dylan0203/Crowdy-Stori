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


  def self.search(params)
    
    collection = 
      if params[:category] && params[:category][:id].present?
        Category.find(params[:category][:id]).chapters
      else
        Chapter.all
      end

    collection = collection.where([ "topic like ?", "%#{params[:keyword]}%"]) if params[:keyword]
    # colelction = collection.where(xxxx) if params[:email]
    collection
  end




end