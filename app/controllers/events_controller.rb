class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  def new
    @event = Event.new
  end

  def create
    authorize @event
  end

  def edit
  end

  def update
    authorize @event
  end

  def destroy
    authorize @event
  end
end
