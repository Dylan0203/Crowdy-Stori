json.stories do
  json.array! @finish, :partial => "chapterlist", :as => :chapter
end