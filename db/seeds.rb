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
  
  5.times do |i|
    User.create(
      name: "user#{i}", 
      admin: false, 
      email: "user#{i}@gmail.com", 
      password: "111111",
      provider: "#{Faker::Number.between}",
      uid: "#{Faker::Number.between}"
    )
  end
  
  User.all.each do |user|
    Post.create!(
      title: Faker::Lorem.paragraph(sentence_count: 1),
      content: Faker::Lorem.paragraph(sentence_count: 7),
      access_date: 20230720,
      address: Gimei.address.kanji,
      latitude: Faker::Number.between(from: 24.0, to: 46.0),
      longitude: Faker::Number.between(from: 123.0, to: 154.0),
      image:File.open("./public/images/image1.jpg"),
      user_id: user.id
    )
  end