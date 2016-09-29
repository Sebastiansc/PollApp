# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: "Bob Rogers")
User.create(user_name: "Bob Dylan")
User.create(user_name: "Niush Lokf")
User.create(user_name: "Cob Kjuhd")

Poll.create(title: "Cookie investigation", author_id: User.first.id)
Poll.create(title: "Pizza investigation", author_id: User.first.id)
Poll.create(title: "Puppy investigation", author_id: User.last.id)
Poll.create(title: "Kitten investigation", author_id: User.second.id)
Poll.create(title: "Brownie investigation", author_id: User.last.id)

Question.create(poll_id: Poll.first.id, question: 'Yum cookies?')
Question.create(poll_id: Poll.first.id, question: 'Cookies anyone?')
Question.create(poll_id: Poll.second.id, question: 'Someone said pizza?')
Question.create(poll_id: Poll.third.id, question: 'Who else dreams puppies ?')

AnswerChoice.create(question_id: Poll.first.id, response: 'Yuuum cookies!!')
AnswerChoice.create(question_id: Poll.first.id, response: 'Cookie up :o')
AnswerChoice.create(question_id: Poll.second.id, response: 'Pizzaforlife')
AnswerChoice.create(question_id: Poll.second.id, response: 'Pizzaordie')
AnswerChoice.create(question_id: Poll.third.id, response: 'Puppy heaven')

Response.create(answer_id: AnswerChoice.first.id, user_id: User.second.id )
Response.create(answer_id: AnswerChoice.third.id, user_id: User.first.id )
Response.create(answer_id: AnswerChoice.last.id, user_id: User.first.id )
