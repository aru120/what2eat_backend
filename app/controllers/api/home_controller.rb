class Api::HomeController < ApplicationController
    skip_before_action :authorized

    def index

        latitude = params[:latitude]
        longitude = params[:longitude]
        offSet = params[:offSet]
        term = params[:term]
        
        response = RestClient::Request.execute(
            method: "GET",
            url: "https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&offset=#{offSet}&term=#{term}",  
            headers: { Authorization: "Bearer #{ENV['YELP_KEY']}" } , 
        )
         results = JSON.parse(response)    
         render json: results  
    end

    def search
        id = params[:id]

        response = RestClient::Request.execute(
            method: "GET",
            url: "https://api.yelp.com/v3/businesses/#{id}",  
            headers: { Authorization: "Bearer #{ENV['YELP_KEY']}" }  
            )    
         results = JSON.parse(response)    
         render json: results 

    end
end
