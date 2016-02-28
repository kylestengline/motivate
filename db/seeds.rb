# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Administrator.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

10.times do |Administrator|
	Administrator.create(
		email: ENV[ADMINISTRATOR_PASSWORD],
		password: ENV[ADMINISTRATOR_PASSWORD]
		)







