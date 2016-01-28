module ChaptersHelper

	def default_chapter_avatar(chapter)	   
    case chapter.category.try(:name)
      when "經典故事"
        image_tag "fairyTale/#{rand(1..16)}.jpg"
      when "結局改編"
        image_tag "reorganization/#{rand(1..14)}.jpg"
      when "時事創作"
        image_tag "currentEvent/#{rand(1..12)}.jpg"
    end
	end

end
