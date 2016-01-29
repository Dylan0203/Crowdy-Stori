json.profile do
  json.array! [ 
  	@profile, :partial => "profile", :as => :p 
  ]
end