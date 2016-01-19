json.stories @finish do |finish|
  json.part finish.depth + 1
  json.id finish.id
  json.setting finish.setting if finish.avatar.present?
  json.topic finish.topic
  json.content finish.content

  json.avatar do 
    json.url api_image_path(finish.avatar.url) 
    json.thumb api_image_path(finish.avatar.thumb.url)
  end if finish.avatar.present?

  json.parent finish.ancestor_ids do |p|
    pp = Chapter.find(p)
    json.part pp.depth + 1
    json.id pp.id
    json.setting pp.setting if pp.avatar.present?
    json.topic pp.topic
    json.content pp.content

    json.avatar do 
    json.url api_image_path(pp.avatar.url) 
    json.thumb api_image_path(pp.avatar.thumb.url)
  end if pp.avatar.present?

  end if finish.ancestor_ids.present?

end

