class MembersController < ApplicationController
  def index
    @members = policy_scope(Member)
  end

  def create
    fetch_event
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
