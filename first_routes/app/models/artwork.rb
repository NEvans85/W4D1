class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id }
  validates :title, :artist_id, :img_url, presence: true

  belongs_to :artist,
             class_name: :User,
             foreign_key: :artist_id

  has_many :artwork_shares,
           dependent: :destroy

  has_many :viewers,
           through: :artwork_shares,
           source: :viewer

  has_many :comments,
           dependent: :destroy

  has_many :commenters,
           through: :comments,
           source: :author
end
