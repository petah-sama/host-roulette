class Guest < ApplicationRecord
  belongs_to :member
  belongs_to :edition
  has_many :reviews
  has_many :answers


end
