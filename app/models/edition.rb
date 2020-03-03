class Edition < ApplicationRecord
  enum status: %i[pending active archived]

  belongs_to :event
  has_many :guests
  has_many :questions
  has_many :items
end
