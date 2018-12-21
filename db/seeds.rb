# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Categorie.create!([{ title: 'HTML' },
                              { title: 'Ruby' },
                              { title: 'php' }])

test1 = Test.create!(title: 'Ruby 1',
                    level: 1,
                    category_id: categories.find_by(title: 'Ruby').id)

test2 = Test.create!(title: 'Ruby 2',
                    level: 2,
                    category_id: categories.find_by(title: 'Ruby').id)

q1 = Question.create!(body: 'How do you create a new hash?',
                    test_id: test1.id)

q1 = Question.create!(body: 'How do you create a new array?',
                    test_id: test1.id)

a1 = Answer.create!(body: 'I have to use {}',
                    correct: true,
                    question_id: q1.id)

user1 = User.create!(name: 'Mike')

ut = UserTest.create!(user_id: user1.id,
                    test_id: test1.id)

