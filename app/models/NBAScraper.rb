require 'nokogiri'
require 'open-uri'

class NBAScraper
    attr_reader :url, :data

    def intialize url 
        @url = url 
    end 

    def data 
        @data || = Nokogiri::HTML(open(url))
    end 

    def get_html_items (tag)
        data.html(tag)
    end 
end 