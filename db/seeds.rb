# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restaurant = Restaurant.create(name:'test canteen',phone1:'3456776')
recipe = []
sample = 20.times do |i|
  recipe << {name:"鱼香肉丝_#{i}", price: 55, restaurant_id:1 }
end
recipes = Recipe.create( recipe )