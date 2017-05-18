class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :note
  validates :user_id, presence: true
  validates :note_id, presence: true
end
