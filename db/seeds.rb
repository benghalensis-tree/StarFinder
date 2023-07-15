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

    post = Post.create(
      title: "test#{i}",
      address: address.kanji,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    )
  end