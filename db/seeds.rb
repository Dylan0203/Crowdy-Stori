# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#user = User.create!( :email => "dylanmail0203@gmail.com", :password => "12345678", :role => "admin")

Category.create!( :name => "經典故事")
Category.create!( :name => "結局改編")
Category.create!( :name => "時事創作")

SuggestCategory.create!( :name => "我要新功能")
SuggestCategory.create!( :name => "問題回報")