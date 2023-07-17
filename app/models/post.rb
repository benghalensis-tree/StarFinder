class Post < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  geocoded_by :address
  after_validation :geocode, if: lambda {|obj| obj.address_changed?}
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

end
