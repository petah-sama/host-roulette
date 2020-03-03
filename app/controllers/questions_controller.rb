class QuestionsController < ApplicationController
  def create
    authorize @question
  end
end
