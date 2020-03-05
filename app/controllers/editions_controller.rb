class EditionsController < ApplicationController
  def index
    @editions = policy_scope(Edition)
  end

  def show
    fetch_edition
  end

  def new
    fetch_event
    @edition = Edition.new
    @edition.event = @event
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

  def fetch_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def fetch_edition
    @edition = Edition.find(params[:id])
    authorize @edition
  end
end
