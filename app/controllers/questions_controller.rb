class QuestionsController < ApplicationController
  before_action :fetch_event_edition, except: :destroy
  before_action :fetch_question, only: %i[show destroy]

  def index
    @questions = policy_scope(Question).where(edition: @edition)
  end

  def create
    @question = Question.new(question_params)
    @question.edition = @edition
    authorize @question
    if @question.save
      status_notification('question')
      redirect_to event_edition_path(@event, @edition)
    else
      render 'editions/show'
    end
  end

  def show

  end

  def destroy
    if @question.destroy
      redirect_to event_edition_questions_path(@question.edition.event, @question.edition)
    else
      render 'questions/show'
    end
  end

  private


  def status_notification(from)
    @edition.event.participants.each do |user|
      next if user == @edition.host
      @notification = Notification.new
      @notification.user = user
      @notification.edition = @edition
      @notification.from = from
      @notification.save
    end
  end

  def fetch_event_edition
    @event = Event.find(params[:event_id])
    @edition = Edition.find(params[:edition_id])
    authorize @event
    authorize @edition
  end

  def fetch_question
    @question = Question.find(params[:id])
    authorize @question
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
