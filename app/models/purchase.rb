class Purchase < ApplicationRecord
  enum category: { note: 0, magazine: 1 }
  validates :object_id, presence: true
  validates :category, presence: true
  validates :price, presence: true
  belongs_to :user
end
