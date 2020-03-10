class ItemsController < ApplicationController

  def new
    fetch_event
    fetch_edition
    @item = Item.new
  end

  def create
    fetch_event
    fetch_edition
    @item = Item.new(item_params)
    # @item.edition = @edition
    if @item.save
      @edition.items << @item
      redirect_to edit_event_edition_path(@event, @edition)
    else
      render :new
    end
  end

  def destroy
    authorize @item
  end

  private

  def fetch_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def fetch_edition
    @edition = Edition.find(params[:edition_id])
    authorize @edition
  end

  def item_params
    params.require(:item).permit(:name, :edition_id)
  end
end
