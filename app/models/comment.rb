class Comment < ApplicationRecord
  validates :text, presence: true
  validates :user_id, presence: true
  validates :note_id, presence: true
  belongs_to :note
  belongs_to :user
end
