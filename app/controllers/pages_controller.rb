class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    if params[:query].present?
      events = policy_scope(Event).includes(:members).where(members: { user:current_user })
      @editions = policy_scope(Edition).where(event_id: events).search_by_name(params[:query])
      @alleditions = policy_scope(Edition).where(event_id: events)
      @hostingeditions = policy_scope(Edition).where(host_id: current_user.id)
      authorize @editions
    else
      events = policy_scope(Event).includes(:members).where(members: { user:current_user })
      @editions = policy_scope(Edition).where(event_id: events)
      @alleditions = @editions
      @hostingeditions = policy_scope(Edition).where(host_id: current_user.id)
      authorize @editions
    end
  end

  def friends
    @friends = current_user.friends
  end

  def past_events
    if params[:query].present?
    events = policy_scope(Event).includes(:members).where(members: { user:current_user })
    @past_editions = Edition.where(event_id: events, status: 2).search_by_name(params[:query])
  else
    events = policy_scope(Event).includes(:members).where(members: { user:current_user })
    @past_editions = Edition.where(event_id: events, status: 2)
  end

  end

  def calendar
    @editions = Edition.all
  end
end
