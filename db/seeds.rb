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
  
  50.times do |i|
    Post.create!(
      title: Faker::Lorem.paragraph(sentence_count: 1),
      content: Faker::Lorem.paragraph(sentence_count: 7),
      access_date: 20230720,
      address: Gimei.address.prefecture.kanji,
      image:File.open("./public/images/star_images/image#{rand(1..7)}.jpg"),
      user_id: User.all.sample.id,
      view_count: rand(3000),
      favorite_count: rand(500)
    )
  end

  100.times do |i|
    Comment.create!(
      content: Faker::Lorem.paragraph(sentence_count: 7),
      user_id: User.all.sample.id,
      post_id: Post.all.sample.id
    )
  end

  Post.all.each do |post|
    Rating.create!(
      sky_light: rand(1..5),
      sky_clear: rand(1..5),
      sky_extent: rand(1..5),
      accessiblity: rand(1..5),
      convenient: rand(1..5),
      post_id: post.id
    )
  end

  50.times do |i|
    ViewCount.create(
      user_id: User.all.sample.id, 
      post_id: Post.all.sample.id
    )
  end

  50.times do |i|
    Favorite.create(
      user_id: User.all.sample.id, 
      post_id: Post.all.sample.id
    )
  end
  