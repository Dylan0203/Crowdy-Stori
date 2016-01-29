json.week_popular do
  json.array! @weekpop, :partial => "chapterlist", :as => :chapter
end