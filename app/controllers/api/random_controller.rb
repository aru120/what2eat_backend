class Api::RandomController < ApplicationController
    skip_before_action :authorized

    def index
        randomNumber = params[:randomNumber]
        latitude = params[:latitude]
        longitude = params[:longitude]

        response = RestClient::Request.execute(
            method: "GET",
            url: "https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&offset=#{randomNumber}&limit=1",  
            headers: { Authorization: "Bearer #{ENV['YELP_KEY']}" } , 
        )
         results = JSON.parse(response)    
         render json: results  
    end

end