class Api::FavoriteController < ApplicationController
    skip_before_action :authorized

    def index
        favorites = Favorite.all
        render json: favorites
    end

    def show
        favorite = Favorite.find(params[:id])
        render json: favorite
    end

    def create
        favorite = Favorite.create!(favorite_params)

        if favorite.valid?
            render json: favorite
        else
            render json: {error: 'failed to save'}, status: :not_acceptable
        end
    end


    def favorite_params
        params.require(:favorite).permit(:user_id,:restaurant_id)
    end

end