class Question < ApplicationRecord
  belongs_to :edition
  has_many :answers, dependent: :destroy
  has_many :guests, through: :answers

  validates :content, presence: true


end
