class Note < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :header_image, ImageUploader

  def last(limit)
    user.notes.order('created_at DESC').limit(limit)
  end

  def prev
    user.notes.where('(is_draft = false) AND (id < ?)', self.id).order('id DESC').first
  end
 
  def next
    user.notes.where('(is_draft = false) AND (id > ?)', self.id).order('id ASC').first
  end

  def published
    user.notes.where(is_draft: false)
  end

  def created_at_jp
    self.created_at.strftime("%Y/%m/%d(#{%w(日 月 火 水 木 金 土)[self.created_at.wday]}) %X")
  end
end
