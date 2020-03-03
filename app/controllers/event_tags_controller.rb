class EventTagsController < ApplicationController
  def create
    authorize @event_tags
  end

  def destroy
    authorize @event_tags
  end
end
