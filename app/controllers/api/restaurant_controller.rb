class Api::RestaurantController < ApplicationController
    skip_before_action :authorized

    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant
    end

    def create

        
        restaurant = Restaurant.create!(restaurant_params)

        if restaurant.valid?
            render json: restaurant
        else
            render json: {error: 'failed to save restaurant'}, status: :not_acceptable
        end
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy!
        render json: {}
    end

    def restaurant_params
        params.require(:restaurant).permit(:yelpid, :yelpalias, :user_id,:name,:image, :categories => [])
    end

end