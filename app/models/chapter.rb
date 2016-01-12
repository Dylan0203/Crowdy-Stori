class Chapter < ActiveRecord::Base
  validates_presence_of :topic, :content

  has_ancestry :cache_depth => true
  belongs_to :user
end