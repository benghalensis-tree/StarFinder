class Post < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :access_date, presence: true, date: {
    after: Date.new(1900, 1, 1)
  }
  validate :custom_geocoder
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_one :rating, dependent: :destroy
  accepts_nested_attributes_for :rating
  

  def self.ransackable_attributes(auth_object = nil)
    ["access_date", "address", "content", "created_at", "id", "image", "latitude", "longitude", "title", "updated_at", "user_id", "view_count", "favorite_count"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["comments", "favorite_users", "favorites", "user", "view_counts"]
  end

  def custom_geocoder
    result = Geocoder.search([latitude, longitude],language: :ja).first.data['address']
    if result.present? == false
      errors.add(:address, "は存在しない住所です。")
    elsif result['country'].include?('日本') == false
      errors.add(:address, 'は日本の地点のみ登録できます。')
    else
      address_arry = []
      address_arry[0] = result['province']
      address_arry[1] = result['city']
      address_arry[2] = result['county']
      address_arry[3] = result['region']
      address_arry[4] = result['quarter']
      address_arry[5] = result['town']
      address_arry[6] = result['road']
      self.address = address_arry.split(',').reverse.join
      
    end
  end
end
