class Category < ActiveRecord::Base
  has_many :chapters
end
