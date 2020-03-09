class Edition < ApplicationRecord
  enum status: %i[pending active archived]
  geocoded_by :address
  belongs_to :event
  has_many :guests
  has_many :questions
  has_many :items
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }


  # So I can test picking a host and code the permissions.
  def host
    User.find(self.host_id)
  end

  def countdown
    unless self.start_time.nil?
      date = Time.now
      days_left = (self.start_time.to_date - date.to_date).to_i
    end
  end
end
