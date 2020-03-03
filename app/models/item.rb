class Item < ApplicationRecord
  belongs_to :edition

  validates :name, presence: true
end
