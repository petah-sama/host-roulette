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
end
