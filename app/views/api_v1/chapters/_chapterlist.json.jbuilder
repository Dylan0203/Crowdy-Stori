  json.part chapter.depth + 1
  json.id chapter.id
  json.setting chapter.setting if chapter.avatar.present?
  json.topic chapter.topic
  json.content strip_tags(chapter.content)

  json.avatar do 
    json.url api_image_path(chapter.avatar.url) 
    json.thumb api_image_path(chapter.avatar.thumb.url)
  end if chapter.avatar.present?

  json.parent chapter.ancestors do |c|
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

  end if chapter.ancestors.present?