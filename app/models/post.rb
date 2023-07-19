class Post < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: lambda {|obj| obj.address_changed?}
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :view_counts

  def self.ransackable_attributes(auth_object = nil)
    ["access_date", "address", "content", "created_at", "id", "image", "latitude", "longitude", "title", "updated_at", "user_id", "view_count"]
  end

end
