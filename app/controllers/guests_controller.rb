class GuestsController < ApplicationController
  def index
    @guests = policy_scope(Guest)
  end

  def create
    authorize @guest
  end

  def new

  end

  def destroy
    authorize @guest
  end

end
