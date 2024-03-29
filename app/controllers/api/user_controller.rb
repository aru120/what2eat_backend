class Api::UserController < ApplicationController
    skip_before_action :authorized

    def index
        users = User.all.includes(:restaurants)
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create 
        @user = User.create!(user_params)

        if @user.valid?
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable 
        end
    end 


    def profile
        render json: { user: current_user}, status: :accepted
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end