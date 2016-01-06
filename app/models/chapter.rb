class Chapter < ActiveRecord::Base
  has_ancestry :cache_depth => true
  belongs_to :user
end