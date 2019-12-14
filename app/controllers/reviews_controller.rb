class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new
    end
  end

  private

  # needed for create method, so hackers cannot mess with my database
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
