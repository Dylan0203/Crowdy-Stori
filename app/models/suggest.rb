class Suggest < ActiveRecord::Base
	validates_presence_of :topic, :content, :suggest_category
	belongs_to :user
	scope :includes_more, -> { includes( :user => :profile ) }
end
