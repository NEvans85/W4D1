class Comment < ApplicationRecord
  validates :author_id, :artwork_id, presence: true

  belongs_to :author,
             class_name: :User

  belongs_to :artwork
end
