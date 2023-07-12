json.extract! post, :id, :title, :content, :access_date, :address, :latitude, :longitude, :image, :view_count, :created_at, :updated_at
json.url post_url(post, format: :json)
