class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :guest

  validates_uniqueness_of :guest_id, scope: :question_id


end
