json.stories @finish do |finish|
  json.part finish.depth + 1
  json.id finish.id
  json.setting finish.setting if finish.avatar.present?
  json.topic finish.topic
  json.content strip_tags(finish.content)

  json.avatar do 
    json.url api_image_path(finish.avatar.url) 
    json.thumb api_image_path(finish.avatar.thumb.url)
  end if finish.avatar.present?

  json.parent finish.ancestors do |c|
    json.part c.depth + 1
    json.id c.id
    json.setting c.setting if c.avatar.present?
    json.topic c.topic
    json.content strip_tags(c.content)
    json.content_images c.image_urls.map {|i| asset_url(i)}

    json.avatar do 
      json.url api_image_path(c.avatar.url) 
      json.thumb api_image_path(c.avatar.thumb.url)
    end if c.avatar.present?

  end if finish.ancestors.present?

end

