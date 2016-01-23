json.continue do
  json.array! @unfinished_chapters, :partial => "chapterlist", :as => :chapter
end