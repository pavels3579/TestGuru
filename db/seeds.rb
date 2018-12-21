# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Categorie.create!([{ title: 'HTML' },
                              { title: 'Ruby' },
                              { title: 'php' }])

Test.create!(title: 'Ruby 1',
                    level: 1,
                    category_id: categories[1].id)

Test.create!(title: 'Ruby 2',
                    level: 2,
                    category_id: categories[1].id)

Question.create!(body: 'How do you create a new hash?',
                    test_id: tests[0].id)

Question.create!(body: 'How do you create a new array?',
                    test_id: tests[0].id)

Answer.create!(body: 'I have to use {}',
                    correct: true,
                    question_id: questions[0].id)

User.create!(name: 'Mike')

UserTest.create!(user_id: users[0].id,
                    test_id: tests[0].id)

