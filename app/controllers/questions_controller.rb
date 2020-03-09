class QuestionsController < ApplicationController
  before_action :fetch_event_edition, except: :destroy
  before_action :fetch_question, only: %i[show destroy]

  def create
    @question = Question.new(question_params)
    @question.edition = @edition
    authorize @question
    if @question.save
      redirect_to event_edition_path(@event, @edition)
    else
      render 'editions/show'
    end
  end

  def show

  end

  def destroy
    if @question.destroy
      redirect_to event_edition_path(@question.edition.event, @question.edition)
    else
      render 'questions/show'
    end
  end

  private

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
