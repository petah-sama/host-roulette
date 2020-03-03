class Question < ApplicationRecord
  belongs_to :edition
  has_many :answers

  validates :content, presence: true
end
