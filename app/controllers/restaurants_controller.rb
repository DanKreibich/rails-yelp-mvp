class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new', :alert => 'invalid restaurant'
    end
  end

  private

  # needed for create method, so hackers cannot mess with my database
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
