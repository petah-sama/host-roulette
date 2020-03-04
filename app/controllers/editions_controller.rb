class EditionsController < ApplicationController
  def index
    @editions = policy_scope(Edition)
  end

  def show
    fetch_edition
  end

  def new
    @edition = Edition.new
    authorize @edition
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

  private



  def fetch_edition
    @edition = Edition.find(params[:id])
    authorize @edition
  end
end
