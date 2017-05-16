class Magazine < ApplicationRecord
  belongs_to :user
  has_many :notes
  has_many :magazine_relationships, dependent: :destroy
  has_many :following_users, through: :magazine_relationships, source: :user
  mount_uploader :header_image, ImageUploader
end
