# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  u = User.create(name: "User#{i}", email: "Test-mail#{i}@mail.it")
  
  2.times do |j|
    Post.create(title: "Post number #{j} of #{u.name}", body: "Example #{j}", user: u)
  end
end

Post.all.each_with_index do |post, i|

  3.times do |j|
    Comment.create(body: "Comment #{j} in post #{i}", post: post, user_id: rand(3)+1)
  end
end