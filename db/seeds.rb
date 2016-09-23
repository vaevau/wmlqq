# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = 'password'

User.create(name: "Kobe", password: password)
User.create(name: "Jon Snow", password: password)

Friendship.create(user_id: User.first.id, friend_id: User.last.id)

Message.create(user_id: User.first.id, friend_id: User.last.id, content: "Hello, Jon Snow")
Message.create(user_id: User.last.id, friend_id: User.first.id, content: "Hello, Kobe")
