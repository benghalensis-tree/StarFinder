require 'faker'
require 'gimei'

  User.create(
    name: 'admin', 
    admin: true, 
    email: "admin@gmail.com", 
    password: "111111"
  )

  30.times do |i|
    address = Gimei.address
    latitude = Faker::Number.between(from: 24.0, to: 46.0)
    longitude = Faker::Number.between(from: 123.0, to: 154.0)

    post = Post.create(
      title: "test#{i}",
      address: address.kanji,
      latitude: latitude,
      longitude: longitude
    )
  end