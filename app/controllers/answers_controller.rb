class AnswersController < ApplicationController
  def create
    authorize @answer
  end
end
