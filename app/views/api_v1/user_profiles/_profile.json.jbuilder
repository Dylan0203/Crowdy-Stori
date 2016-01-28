json.username p.username.to_s
json.picture p.picture.to_s
json.gender p.gender.to_s
json.birthday p.birthday.to_s
json.bloodtype p.bloodtype.to_s
json.interest p.interest.to_s
json.about_me p.about_me.to_s
json.voice p.voice.to_s

if p.user.chapters
	json.participated p.user.chapters do |pp|
		json.id pp.id
		json.topic pp.topic
		json.url v1_chapter_url(pp)
	end
end