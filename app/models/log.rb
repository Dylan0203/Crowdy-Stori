class Log < ActiveRecord::Base

	validates_presence_of :topic, :content
	belongs_to :user

end
