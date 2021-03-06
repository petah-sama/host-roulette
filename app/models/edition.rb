class Edition < ApplicationRecord
  enum status: %i[pending active archived]
  geocoded_by :address
  belongs_to :event
  has_many :guests
  has_many :questions
  has_many :notifications
  has_many :answers, through: :questions
  has_many :edition_items
  has_many :items, through: :edition_items
  has_many :reviews, through: :guests
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  monetize :price_cents

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  def host
    User.find_by(id: host_id)
  end

  def countdown
    unless self.start_time.nil?
      date = Time.now
      days_left = (self.start_time.to_date - date.to_date).to_i
    end
  end
end
