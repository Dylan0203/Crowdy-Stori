json.id chapter.id

unless chapter.ancestry
  json.ancestry chapter.ancestry = ""
else
  json.ancestry chapter.ancestry.try(:split, '/')
end

json.categoryId chapter.category_id.to_s

if chapter.category
  json.category chapter.category.name
end

json.topic chapter.topic

json.setting chapter.setting.to_s

json.content strip_tags(chapter.content)

json.finish chapter.finish.to_s

json.user_id chapter.user_id.to_s

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
