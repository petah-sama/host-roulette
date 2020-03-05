class Edition < ApplicationRecord
  enum status: %i[pending active archived]

  belongs_to :event
  has_many :guests
  has_many :questions
  has_many :items

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }


  # So I can test picking a host and code the permissions.
  def picking_host
    self.guests.sample.participants.id
  end

end
