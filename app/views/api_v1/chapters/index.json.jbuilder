json.data do
  json.array! @chapters, :partial => "chapter", :as => :chapter
end

#json.meta do
#json.current_page @chapters.current_page
#json.total_pages @chapters.total_pages
#json.per_page @chapters.limit_value
#json.next_url (@chapters.last_page?)? nil : v1_chapters_url( :page => @chapters.next_page )
#json.previous_url (@chapters.first_page?)? nil : v1_chapters_url( :page => @chapters.prev_page )
#end