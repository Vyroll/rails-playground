# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
2.times do |i|
  user = User.new
  user.email = "user#{i + 1}@example.com"
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
  users << user
end

9.times do
  article = Article.create(
    title: Faker::Lorem.sentence(3, false, 4),
    text: Faker::Lorem.paragraph_by_chars(Random.rand(250..1000), false),
    user: users.sample
  )

  Random.rand(0..3).times do
    article.comments.create(
      body: Faker::Lorem.sentence(3, false, 4),
      user: users.sample
    )
  end
end
