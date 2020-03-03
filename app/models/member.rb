class Member < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :guests
end
