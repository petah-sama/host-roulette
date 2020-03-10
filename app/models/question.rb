class Question < ApplicationRecord
  belongs_to :edition
  has_many :answers, dependent: :destroy

  validates :content, presence: true
end
