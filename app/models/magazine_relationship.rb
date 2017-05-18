class MagazineRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :magazine
  validates :user_id, presence: true
  validates :magazine_id, presence: true
end
