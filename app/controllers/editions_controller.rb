class EditionsController < ApplicationController
  def index
    @editions = policy_scope(Edition)
  end

  def show
    authorize @edition
  end

  def new
  end

  def create
    authorize @edition
  end

  def edit
  end

  def update
    authorize @edition
  end

  def destroy
    authorize @edition
  end
end
