class Review < ApplicationRecord
  belongs_to :guest

  validates :edition_rating, presence: true
  validates :host_rating, presence: true
end
