class Comment < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  belongs_to :post
  belongs_to :user
end
