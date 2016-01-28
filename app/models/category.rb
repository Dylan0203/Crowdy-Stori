class Category < ActiveRecord::Base
  
  # TODO: validation
  validates_presence_of :name
  
  has_many :chapters

end
