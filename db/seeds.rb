# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create!(
                               [
                                 { title: 'HTML' },
                                 { title: 'Ruby' },
                                 { title: 'php' }
                               ]
                              )

user = User.create!(email: 'Mike@yandex.ru')

test1 = Test.create!(title: 'Ruby 1',
                    level: 1,
                    category_id: categories[1].id,
                    author_id: user.id)

Test.create!(title: 'Ruby 2',
                    level: 2,
                    category_id: categories[1].id,
                    author_id: user.id)

question1 = Question.create!(body: 'How do you create a new hash?',
                             test_id: test1.id)

question2 = Question.create!(body: 'How do you create a new array?',
                 test_id: test1.id)

Answer.create!(body: 'I have to use {}',
               correct: true,
               question_id: question1.id)

Answer.create!(body: 'I have to use :',
               correct: false,
               question_id: question1.id)

Answer.create!(body: 'I have to use {}',
               correct: false,
               question_id: question2.id)

Answer.create!(body: 'I have to use []',
               correct: true,
               question_id: question2.id)

Answer.create!(body: 'I have to use .new',
               correct: false,
               question_id: question2.id)




