FactoryBot.define do
  factory :post do
    title { '投稿のタイトル1' }
    content { '投稿のコンテント1' }
    access_date { Date.today }
    address { '東京' }
    latitude { 36.114394 }
    longitude { 138.0319015 }
    view_count { 1000 }
    favorite_count { 1000 }
    association :user
  end
end