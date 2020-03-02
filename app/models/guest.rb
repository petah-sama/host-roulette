class Guest < ApplicationRecord
  belongs_to :member
  belongs_to :edition
end
