class MembersController < ApplicationController
  before_action :fetch_event, except: :destroy

  def index
    @members = policy_scope(@event.participants)

    render json: @members.as_json(only: [:first_name, :last_name])
  end

  def create
    @member = Member.new
    @member.user = current_user
    @member.event = @event
    authorize @member

    @member.save
    redirect_to event_path(@event)
  end

  def destroy
    authorize @member
  end

  private

  def fetch_event
    @event = Event.find(params[:event_id])
    authorize @event
  end
end
