class MembersController < ApplicationController
  def index
    @members = policy_scope(Member)
  end

  def create
    authorize @member
  end

  def new
  end

  def destroy
    authorize @member
  end
end
