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

#a = 
Administrator.create!(
	email: ENV["ADMINISTRATOR_EMAIL"],
	password: ENV["ADMINISTRATOR_PASSWORD"]
)
# a.save!(validate: false)

15.times do |user| 
#u =	
		User.create!(
		email: Faker::Internet.free_email,
		password: 'user',
		administrator_id: '1'
		)
# u.save!(validate: false)
end

Post.create!([
	{author: "Earl Nightingale", content: "When you judge others, you do not define them; you define yourself.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Jim Carrey", content: "You can fail at what you don't want. So you might as well take a chance on doing what you love.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Maya Angelou", content: "You alone are enough. You have nothing to prove.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Albert Einstein", content: "Logic will get you from A to B. Imagination will take you everywhere.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Unknown", content: "Forgive, not because they deserve forgiveness, but because you deserve peace.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Lao Tzu", content: "Whoever can see through all fear will always be safe.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: 'Lao Tzu', content: "Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Chinese Proverb", content: "The person who says it cannot be done should not interrupt the person doing it.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Nelson Mandela", content: "It always seems impossible until it's done.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "George M. Moore Jr.", content: "A winner is just a loser who tried one more time.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Japanese Proverb", content: "Fall down seven times, get up eight.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Napoleon Hill", content: "Nothing can be called failure until you accept it as such.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Winston Churchill", content: "If you're going through hell keep going.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Jim Rohn", content: "Don't wish it were easier, wish you were better.", user_id: rand(1..15), votes: Faker::Number.number(1)}, 
	{author: "Socrates", content: "The secret of change is to focus all of your energy, not on fighting the old, but on building the new.", user_id: rand(1..15), votes: Faker::Number.number(1)}
	])

15.times do |comment| 
	Comment.create!(
		post_id: rand(1..15), 
		user_id: rand(1..15), 
		content: Faker::Lorem.paragraph,
		votes: Faker::Number.number(1)
		)
end

p "Created #{Administrator.count} Administrators"
p "Created #{User.count} Users"
p "Created #{Comment.count} Comment"
p "Created #{Post.count} Posts"





