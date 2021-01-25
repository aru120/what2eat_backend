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

    def reviews
        id = params[:id]
        

        response = RestClient::Request.execute(
            method: "GET",
            url: "https://api.yelp.com/v3/businesses/#{id}/reviews",  
            headers: { Authorization: "Bearer #{ENV['YELP_KEY']}" }  
            )    
         results = JSON.parse(response)    
         render json: results 
    end

    # def randomFinder
    #     randomNumber = params[:randomNumber]
    #     latitude = params[:latitude]
    #     longitude = params[:longitude]

    #     response = RestClient::Request.execute(
    #         method: "GET",
    #         url: "https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&offset=#{randomNumber}&limit=1",  
    #         headers: { Authorization: "Bearer #{ENV['YELP_KEY']}" } , 
    #     )
    #      results = JSON.parse(response)    
    #      render json: results  
        
    # end
end
