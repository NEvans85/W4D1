class Artwork < ApplicationRecord
  validates_uniqueness_of :title, scope: :artist_id
  validates :title, :artist_id, :img_url, presence: true

  belongs_to :artist,
             class_name: :User,
             foreign_key: :artist_id
end
