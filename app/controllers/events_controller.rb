class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event

    @edition = Edition.new
    @edition.event = @event
    next_edition_id = @event.editions.last.id + 1
    @edition.name = "#{@event.name} #{next_edition_id}"
    authorize @edition

    if @event.save && @edition.save
      redirect_to event_edition_path(@event, @edition)
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize @event
  end

  def destroy
    authorize @event
  end

  private

  def fetch_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :budget, :frequency)
  end
end
