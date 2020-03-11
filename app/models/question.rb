class Question < ApplicationRecord
  belongs_to :edition
  has_many :answers, dependent: :destroy
  has_many :guests, through: :answers

  validates :content, presence: true




  def answered_yes
    answered_yes = []
    self.answers.each do |answer|
      answered_yes << answer if answer.content == true
    end
    answered_yes.size
  end

  def answered_no
    answered_no = []
    self.answers.each do |answer|
      answered_no << answer if answer.content == false
    end
    answered_no.size
  end
  def unanswered
    unanswered = (self.edition.guests.size - 1)-(self.answered_yes + self.answered_no)
  end

  def unanswered_questions
    unanswered = []
    self.answers.each do |answer|
      unanswered << answer if answer.content == false
    end
  end

  def guests_didnt_answer
    guests = []
     self.edition.guests.each do |guest|
      guest.answers.each do |answer|
        if answer.question == self && self.edition.host != guest.member.user
          guests << guest
        end
      end
    end
    return guests
  end


end
