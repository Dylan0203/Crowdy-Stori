namespace :dev do
  
  task :generate_user_token => :environment do

    User.find_each do |u|
      puts "generate user #{u.id} token"
      u.generate_authentication_token
      u.save!
    end

  end

  task :fake_suggests => :environment do

  	Suggest.destroy_all

  	10.times do	|i|
      ca = ["我要建議", "我要回報"]

  		Suggest.create!( topic:"Suggestion#{i}", content:"Whatever!", suggest_category: ca.shuffle.first, user_id: User.last.id)
  	end
  end

end