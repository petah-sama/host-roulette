class Tag < ApplicationRecord
  has_many :event_tags

  validates :name, presence: true, uniqueness: true
end
