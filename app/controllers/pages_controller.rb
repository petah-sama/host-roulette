class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    if params[:query].present?
      @events = policy_scope(Event).includes(:members).where(members: { user:current_user }).search_by_name(params[:query])
      authorize @events
    else
      @events = policy_scope(Event).includes(:members).where(members: { user:current_user })
      authorize @events
    end
  end

  def friends
    @friends = current_user.friends
  end

  def past_events
  end

  def calendar
    @editions = Edition.all
  end
end
