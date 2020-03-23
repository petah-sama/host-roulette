class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.host_avg_rating = user_avg_rating(@user.id)
    authorize @user
    @user.save
  end

  def user_avg_rating(user_id)
    editions = Edition.where( host_id: user_id )
    sum = editions.sum(:host_avg_rating)
    sum / editions.size.to_f
  end
end
