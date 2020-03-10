class EditionsController < ApplicationController
  before_action :fetch_edition, only: %i[show edit update destroy]
  before_action :fetch_event, only: %i[new show create update]

  def index
    @editions = policy_scope(Edition)
  end

  def show
    @question = Question.new
    @edition_calendar = Edition.where(id: @edition.id)
    @answer = Answer.new

    @review = Review.new

    @current_guest = current_user.guest_for(@edition)
    @current_user_answers = @edition.answers.where(guest: @current_guest)

    @markers = [{
      lat: @edition.latitude,
      lng: @edition.longitude,
      infoWindow: render_to_string(partial: "editions/show-editions/info_window", locals: { edition: @edition }),
      image_url: helpers.asset_url('location.png')
    }]
    authorize @edition
    authorize @current_user_answers
  end

  def new
    @edition = Edition.new
    @edition.event = @event
    authorize @edition
  end

  def create
    @edition = Edition.new(edition_params)
    @edition.event = @event
    edition_number = @event.editions.size + 1
    @edition.name = @event.name + ' #' + edition_number.to_s

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
    events = policy_scope(Event).includes(:members).where(members: { user: current_user })
    fetch_event
    @items = Item.all
    @item = Item.new
    authorize @event
  end

  def update
    if @edition.update(edit_edition_params)
      status_notification
      redirect_to event_edition_path(@event, @edition)
    else
      render :edit
    end
  end

  def destroy
    authorize @edition
  end

  private

  def status_notification
    if @edition.status == 'active'
      @edition.event.participants.each do |user|
        @notification = Notification.new
        @notification.user = user
        @notification.edition = @edition
        @notification.from = 'active'
        # @notification.content = path necessário pra fazer o link
        @notification.save
      end
      redirect_to event_edition_path(@event, @edition)
    end
  end

  def fetch_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def fetch_edition
    @edition = Edition.find(params[:id])
    authorize @edition
  end

   def edit_edition_params
    params.require(:edition).permit(:name, :start_time, :end_time, :notes, :address, :status, item_ids: [])
  end

  def edition_params
    params.require(:edition).permit(:host_id)
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
