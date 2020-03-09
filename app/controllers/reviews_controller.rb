class ReviewsController < ApplicationController
  def create
    @edition = Edition.find(params[:edition_id])
    @event = @edition.event
    @review = Review.new(review_params)
    @guest = @event.members.where(user_id: current_user.id).first.guests.where(edition_id: params[:edition_id]).first
    @review.guest = @guest
    authorize @review
    # Event.last.members.last.guests
    if @review.save
      respond_to do |f|
        f.html { redirect_to event_edition_path(@event, @edition) }
        f.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |f|
        f.html { render 'editions/show' }
        f.js  # <-- idem
      end
    end
  end

  def update
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :edition_rating, :host_rating)
  end
end

  # def create
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.new(review_params)
  #   @review.restaurant = @restaurant
  #   if @review.save
  #     redirect_to restaurant_path(@restaurant)
  #   else
  #     render 'restaurants/show'
  #   end
  # end

  # private

  # def review_params
  #   params.require(:review).permit(:content)
  # end
