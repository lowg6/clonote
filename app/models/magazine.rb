class Magazine < ApplicationRecord
  belongs_to :user
  has_many :notes
  mount_uploader :header_image, ImageUploader
end
