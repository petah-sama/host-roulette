class AnswersController < ApplicationController
    before_action :fetch_event_edition_question, except: :destroy
    before_action :fetch_answer, only: %i[edit update destroy]

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question

    current_member = @event.members.where(user_id: current_user.id).first
    current_guest = @edition.guests.where(member_id: current_member.id).first

    @answer.guest_id = current_guest.id
    authorize @answer
    if @answer.save
      redirect_to event_edition_path(@event, @edition)
    else
      render 'editions/show'
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to event_edition_path(@event, @edition)
    else
      render 'editions/show'
    end
  end

  private

  def fetch_event_edition_question
    @event = Event.find(params[:event_id])
    @edition = Edition.find(params[:edition_id])
    @question = Question.find(params[:question_id])
    authorize @question
    authorize @event
    authorize @edition
  end

  def fetch_answer
    @answer = Answer.find(params[:id])
    authorize @answer
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
