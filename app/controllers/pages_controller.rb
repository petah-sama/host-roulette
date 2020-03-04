class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    if params[:query].present?
      @events = policy_scope(Event).includes(:members).where(members: { user:current_user }).search_by_name(params[:query])
      @editions = Edition.where(event_id: @events)
      authorize @editions
    else
      @events = policy_scope(Event).includes(:members).where(members: { user:current_user })
      @editions = Edition.where(event_id: @events)

      authorize @editions
    end
  end

  def friends
    @friends = current_user.friends
  end

  def past_events
  end
end
