class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :members
  has_many :events
  has_one_attached :photo

  def friends
    events_ids = self.members.pluck(:event_id)
    friends_ids = Member.where(event_id: events_ids).pluck(:user_id)

    User.where(id: friends_ids).where.not(id: self.id)
  end

  def guest_for(edition)
    current_member = edition.event.members.find_by(user: self)

    edition.guests.find_by(member: current_member)
  end

  def is_host?(edition)
    unless edition.host_id.nil?
      self.id == edition.host_id
    end
  end

  def is_guest?(edition)
    !(self.is_host?(edition))
  end
end
