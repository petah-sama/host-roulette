class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :edition
  enum from: %i[seen active host questions]
  validates :user_id, presence: true

  #later on we can remove the content column
  #since it's gonna be set in the view
end
