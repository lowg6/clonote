class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true
  validates :noteid, uniqueness: true
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :magazine_relationships, dependent: :destroy
  has_many :follow_magazines, through: :magazine_relationships, source: :magazine
  has_many :favorites, dependent: :destroy
  has_many :favorite_notes, through: :favorites, source: :note
  has_many :notes, dependent: :destroy
  has_many :magazines, dependent: :destroy
  has_many :comments
  has_many :purchases
  mount_uploader :header_image, ImageUploader
  mount_uploader :image, ImageUploader

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def prefollow!(other_user)
    following_relationships.build(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def favorite?(note)
    favorites.find_by(note_id: note.id)
  end

  def prefavorite!(note)
    favorites.build(note_id: note.id)
  end

  def favorite!(note)
    favorites.create!(note_id: note.id)
  end

  def unfavorite!(note)
    favorites.find_by(note_id: note.id).destroy
  end

  def magazine_following?(magazine)
    magazine_relationships.find_by(magazine_id: magazine.id)
  end

  def magazine_prefollow!(magazine)
    magazine_relationships.build(magazine_id: magazine.id)
  end

  def magazine_follow!(magazine)
    magazine_relationships.create!(magazine_id: magazine.id)
  end

  def magazine_unfollow!(magazine)
    magazine_relationships.find_by(magazine_id: magazine.id).destroy
  end
end
