class Item < ApplicationRecord
  has_many :edition_items
  has_many :editions, through: :edition_items


  validates :name, presence: true
end
