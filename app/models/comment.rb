class Comment < ApplicationRecord
  validates :text, presence: true
  validates :user_id, presence: true
  validates :note_id, presence: true
  belongs_to :note
  belongs_to :user

  def created_at_jp
    self.created_at.strftime("%Y/%m/%d(#{%w(日 月 火 水 木 金 土)[self.created_at.wday]}) %X")
  end
end
