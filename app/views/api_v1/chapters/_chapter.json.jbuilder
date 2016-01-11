json.id chapter.id
json.ancestry chapter.ancestry
json.topic chapter.topic
json.setting chapter.setting
json.content chapter.content
json.finish chapter.finish
json.user_id chapter.user_id
  if chapter.user
    json.user do
      json.id chapter.user.id
      json.display_name chapter.user.display_name
      json.email chapter.user.email
    end
  end
json.view chapter.view

json.created_at chapter.created_at
json.updated_at chapter.updated_at