class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)
  end

  def show
    fetch_event
    authorize @event

    @member = Member.new

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

    if @event.save && @member.save
      @tags = params["event"]["tag_ids"].to_a.drop(1)
      gen_tags
      redirect_to event_path(@event)
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

  def gen_tags
    @tags.each do |tag_id|
      tag = Tag.find(tag_id)
      EventTag.create(tag: tag, event: @event)
    end
  end
end
