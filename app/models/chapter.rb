class Chapter < ActiveRecord::Base

  validates_presence_of :topic, :content, :category_id

  has_ancestry :cache_depth => true
  belongs_to :user
  belongs_to :category

  mount_uploader :avatar, AvatarUploader

  scope :includes_more, -> { includes( :category, :user => :profile ) }
  
  scope :weekpop, -> { where( ["created_at >= ?", Time.now - 7.days ] ).order("view DESC").limit(5) }
  scope :finished, ->{ where( :finish => true ) }
  scope :unfinished, ->{ where( :finish => false ) }
  scope :begins, ->{ where( :ancestry => nil ) }
  scope :mostpop, ->{ order("view DESC") }

  before_validation :setup_default_category, :on => :create

  def can_continue?
    self.depth < 2 && !self.finish
  end

  # TODO: add test  
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

  protected

  def setup_default_category
    if self.parent
      self.category_id = self.parent.category_id
    end
  end

end