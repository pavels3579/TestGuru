# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create!(
                               [
                                 { title: 'Frontend' },
                                 { title: 'Backend' },
                                 { title: 'net' }
                               ]
                              )

user = User.create!(email: 'm@ya.ru',
                    password: '123456',
                    confirmed_at: Time.now)

admin = Admin.create!(email: 'qwe@ya.ru',
                      password: '123456',
                      first_name: 'Paul',
                      last_name: 'Semenkin',
                      confirmed_at: Time.now)

test1 = Test.create!(title: 'Ruby 1',
                    level: 1,
                    category_id: categories[1].id,
                    author_id: user.id)

Test.create!(title: 'HTML',
                    level: 2,
                    category_id: categories[0].id,
                    author_id: user.id)

question1 = Question.create!(body: 'How do you create a new hash?',
                             test_id: test1.id)

question2 = Question.create!(body: 'How do you create a new array?',
                 test_id: test1.id)

question3 = Question.create!(body: 'How do you add to array?',
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

Answer.create!(body: 'I have to use push',
               correct: true,
               question_id: question3.id)

Answer.create!(body: 'I have to use add',
               correct: false,
               question_id: question3.id)

Badge.create!(title: 'For first successfull try',
              url: 'https://image.flaticon.com/icons/png/128/1579/1579490.png',
              rule_name: 'success_first_try',
              rule_value: '')

Badge.create!(title: 'For first level tests',
              url: 'https://image.flaticon.com/icons/png/128/1579/1579491.png',
              rule_name: 'level',
              rule_value: '1')

Badge.create!(title: 'For successfull backend tests',
              url: 'https://image.flaticon.com/icons/png/128/1579/1579492.png',
              rule_name: 'category',
              rule_value: 'backend')


