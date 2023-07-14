require 'faker'

  User.create(
    name: 'admin', 
    admin: true, 
    email: "admin@gmail.com", 
    password: "111111"
  )

  100.times do |i|
    
    post = Post.create(
      title: "test#{i}",
      latitude: Faker::Number.between(from: 24.0, to: 46.0),
      longitude: Faker::Number.between(from: 123.0, to: 154.0)
    )
  end