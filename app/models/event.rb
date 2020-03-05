class Event < ApplicationRecord
  belongs_to :user
  has_many :event_tags
  has_many :tags, through: :event_tags
  has_many :editions
  has_many :members
  has_many :participants, through: :members, source: :user

  validates :name, presence: true
  validates :budget, presence: true
  validates :frequency, presence: true


end
