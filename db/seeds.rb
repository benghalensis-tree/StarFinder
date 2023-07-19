require 'faker'
require 'gimei'

  User.create(
    name: 'admin', 
    admin: true, 
    email: "admin@gmail.com", 
    password: "111111",
    provider: "#{Faker::Number.between}",
    uid: "#{Faker::Number.between}"
  )
  
  3.times do |i|
    User.create(
      name: "user#{i}", 
      admin: false, 
      email: "user#{i}@gmail.com", 
      password: "111111",
      provider: "#{Faker::Number.between}",
      uid: "#{Faker::Number.between}"
    )
  end

  users = User.all

  30.times do |i|
    latitude = Faker::Number.between(from: 24.0, to: 46.0)
    longitude = Faker::Number.between(from: 123.0, to: 154.0)

    post = Post.create(
      title: "test#{i}",
      address: "test#{i}",
      latitude: latitude,
      longitude: longitude,
      image:File.open("./public/images/image1.jpg"),
      user_id: rand(users.length)
    )
  end