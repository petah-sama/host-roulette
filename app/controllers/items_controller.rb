class ItemsController < ApplicationController
  def create
    authorize @item
  end

  def destroy
    authorize @item
  end
end
