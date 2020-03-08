class EditionsController < ApplicationController
  before_action :fetch_edition, only: %i[edit update destroy]
  def index
    @editions = policy_scope(Edition).geocoded
  end

  def show
    if Edition.find(params[:id]).latitude.present?
      @edition = Edition.geocoded.find(params[:id])
      authorize @edition
      @markers = [{
        lat: @edition.latitude,
        lng: @edition.longitude,
        infoWindow: render_to_string(partial: "editions/show-editions/info_window", locals: { edition: @edition }),
        image_url: helpers.asset_url('location.png')
      }]
    else
      @edition = Edition.find(params[:id])
      authorize @edition
    end

  end

  def new
    fetch_event
    @edition = Edition.new
    @edition.event = @event
    authorize @edition
  end

  def create
    fetch_event
    @edition = Edition.new(edition_params)
    @edition.event = @event
    # host_id = params["query"].to_i
    # host_user = User.find(host_id)
    # @edition.host_id = host_user.id
    authorize @edition
    if @edition.save
      gen_guests
      redirect_to event_edition_path(@event, @edition)
    else
      render :new
    end
  end

  def edit
    events = policy_scope(Event).includes(:members).where(members: { user:current_user })
  end

  def update
    if @edition.update(edit_edition_params)
      redirect_to event_edition_path
    else
      render :edit
    end
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

  def edition_params
    params.require(:edition).permit(:host_id)
  end

  def edit_edition_params
    params.require(:edition).permit(:name, :start_time, :end_time, :status, :address)
  end

  def gen_guests
    @edition.event.members.each do |member|
      guest = Guest.new
      guest.member = member
      guest.edition = @edition
      guest.save
    end
  end
end
