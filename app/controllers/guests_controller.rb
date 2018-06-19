require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
class GuestsController < ApplicationController
    
    def index 
        if params[:category] == "mlb"
            api_url = "https://search-api.mlb.com/svc/search/v2/mlb_global_en/topic/8879974?page=2&sort=new&type=video&hl=false&expand=image&listed=true%27"
            website = `curl #{api_url}`
            @mlb = JSON.parse(website)
            # fetch()
            render '/guests/index'
        elsif params[:category] == "nba"
                newurl = "https://api.nba.net/0/league/collection/35382d0c-7a99-4ad2-b458-d58ca1b50980?accessToken=3830242580404678b2552bbdd03b73ee"
                website = `curl #{newurl}`
                @hash = JSON.parse(website)
                render '/guests/index'
        else 
            render '/guests/index'
        end 

    end 
    
    def create 
        
        redirect_to '/guests'
    end 
end
# https://www.mlb.com/dodgers/video/t-8877590  Dodgers game recaps

#curl link from API and somehow click to start video and then grab the src from the video tag via curl again?
