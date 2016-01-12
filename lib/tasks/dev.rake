namespace :dev do
  
  task :generate_user_token => :environment do

    User.find_each do |u|
      puts "generate user #{u.id} token"
      u.generate_authentication_token
      u.save!
    end

  end

end