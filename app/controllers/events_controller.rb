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

    @member = Member.new
    @member.user = current_user
    @member.event = @event
    authorize @member

    @edition = Edition.new
    @edition.event = @event
    @edition.name = "#{@event.name} #1"
    authorize @edition

    if @event.save && @edition.save && @member.save
      @tags = params["event"]["tag_ids"].to_a.drop(1)
      gen_tags
      redirect_to event_edition_path(@event, @edition)
    else
      render :new
    end
  end

  def join
    fetch_event
    # @authorize @event
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

  def gen_tags
    @tags.each do |tag_id|
      tag = Tag.find(tag_id)
      EventTag.create(tag: tag, event: @event)
    end
  end
end
