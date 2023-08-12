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
      address: Gimei.address.prefecture.kanji,
      image:File.open("./public/images/image1.jpg"),
      user_id: user.id,
      view_count: rand(3000)
    )

    Post.all.each do |post|
      Comment.create!(
        content: Faker::Lorem.paragraph(sentence_count: 7),
        user_id: User.all.sample.id,
        post_id: post.id
      )
    end

    Post.all.each do |post|
      Rating.create!(
        sky_light: rand(0..5),
        sky_clear: rand(0..5),
        sky_extent: rand(0..5),
        accessiblity: rand(0..5),
        convenient: rand(0..5),
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
  end