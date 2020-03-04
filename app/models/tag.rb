class Tag < ApplicationRecord
  has_many :event_tags
  has_many :events, through: :event_tags

  validates :name, presence: true, uniqueness: true
end
