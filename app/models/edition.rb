class Edition < ApplicationRecord
  enum status: %i[pending active archived]

  belongs_to :event
end
