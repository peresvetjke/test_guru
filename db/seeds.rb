# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i|
  Category.create(title: "Category ##{i}")
end

5.times do |i|
  Test.create(title: "Test ##{i} (category_id: 1, level: 1)", category_id: 1, level: 1) 
end

5.times do |i|
  Test.create(title: "Test ##{i} (category_id: 1, level: 2)", category_id: 1, level: 2) 
end

5.times do |i|
  Test.create(title: "Test ##{i} (category_id: 2, level: 1)", category_id: 2, level: 1) 
end

5.times do |i|
  Test.create(title: "Test ##{i} (category_id: 2, level: 2)", category_id: 2, level: 2) 
end

2.times do |i|
  User.create(login: "User ##{i}")
end

5.times do |i|
  Assessment.create(test_id: i, user_id: 1)
  Assessment.create(test_id: i+5, user_id: 2)
end