class Post < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  geocoded_by :address
  after_validation :geocode, if: lambda {|obj| obj.address_changed?}

end
