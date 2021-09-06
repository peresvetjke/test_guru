# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for c_i in 1..3
  category = Category.create(title: "Category ##{c_i}")
  user = User.create(login: "User ##{c_i}")
  
  for t_i in 1..5
    test = Test.create(title: "Test ##{t_i} (category_id: #{category.id}, level: #{t_i%2})", category_id: category.id, level: t_i%2)
    Assessment.create(test_id: t_i, user_id: user.id)
  end
end

