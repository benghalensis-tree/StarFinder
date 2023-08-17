class Post < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :access_date, presence: true, date: {
    after: Date.new(1900, 1, 1)
  }
  validate :address_present
  reverse_geocoded_by :latitude, :longitude, language: :ja
  after_validation :reverse_geocode
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

  def address_present  
    if Geocoder.address([latitude, longitude]).present? == false
      errors.add(:address, "は存在しない住所です。")
    elsif Geocoder.address([latitude, longitude]).include?('Japan') == false
      errors.add(:address, 'は日本の地点のみ登録できます。')
    end
  end

end
