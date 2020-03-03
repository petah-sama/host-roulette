class ReviewsController < ApplicationController
  def create
    authorize @review
  end

  def update
    authorize @review
  end
end
