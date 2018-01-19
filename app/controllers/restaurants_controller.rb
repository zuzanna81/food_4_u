class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    if params[:search]
      @assortment = params[:search]
      @results = Restaurant.all.select do |restaurant|
        restaurant.assortment.include? @assortment.capitalize
      end
      flash[:danger] = 'No restaurants found.' if @results.none?
      render :index
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus.all
  end
end
