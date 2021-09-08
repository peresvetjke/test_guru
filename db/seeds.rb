# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for c_i in 1..3
  category = Category.create(title: "Category ##{c_i}")
  author = User.create(login: "Author ##{c_i}")
  user = User.create(login: "User ##{c_i}")
  
  for t_i in 1..5
    test = Test.create(title: "Test ##{t_i} (category_id: #{category.id}; level: #{t_i}; author: #{author.id})", category_id: category.id, level: t_i, author_id: author.id)
    Assessment.create(test_id: t_i, user_id: user.id)

    for q_i in 1..5
    question = Question.create(body: "Question #{q_i} (test_id: #{test.id})", test_id: test.id)
      
      a_max = 3
      for a_i in 1..a_max
        corr = a_i == a_max ? true : false
        answer = Answer.create(body: "Answer #{a_i} (test_id: #{test.id}; question_id: #{q_i})" , question_id: question.id, correct: corr)
      end
    end
  end
end

