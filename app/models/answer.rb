class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :guest

  validates :content, presence: true
end
