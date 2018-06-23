require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
class GuestsController < ApplicationController
    def index 
        render 'guests/index'
    end 
    def mlb 
        api_url = "https://search-api.mlb.com/svc/search/v2/mlb_global_en/topic/8879974?page=2&sort=new&type=video&hl=false&expand=image&listed=true%27"
        website = `curl #{api_url}`
        # if @mlb == nil
        #     @error = "We're currently having trouble accessing your videos. Sorry, try again later."
        # else 
            @mlb = JSON.parse(website)
        # end 
        render 'guests/results'
    end 
    def nba
        newurl = "https://api.nba.net/0/league/collection/35382d0c-7a99-4ad2-b458-d58ca1b50980?accessToken=3830242580404678b2552bbdd03b73ee"
        website = `curl #{newurl}`
        # if @hash == nil
        #     @error = "We're currently having trouble accessing your videos. Sorry, try again later."
        # else 
            @hash = JSON.parse(website)
        # end 
        render 'guests/results'
    end 

    def watch 
        site_to_curl = "https://www.mlb.com/video/recap-col-10-nym-8/c-2179231383"
        @curl = `curl #{site_to_curl}`
        
        render 'guests/videos'
    end 
    def create 
        redirect_to '/guests'
    end 

    def show 
    end 
end
# https://www.mlb.com/dodgers/video/t-8877590  Dodgers game recaps

#curl link from API and somehow click to start video and then grab the src from the video tag via curl again?

# <video src="https://mediadownloads.mlb.com/mlbam/mp4/2018/06/21/2179231383/1529559931830/asset_1800K.mp4">

#<video src="https://mediadownloads.mlb.com/mlbam/mp4/2018/06/21/2179231783/1529559679914/asset_1800K.mp4">
