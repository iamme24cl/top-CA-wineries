class TopCAWineries::Scraper
    
    @@doc = []
    @@region_array = []
    @@winery_array = []
    @@winery_info_array = []

   
        
    def self.scrape
        site = "https://thepress.sfchronicle.com/article/52-california-wineries-2019/" 
        @@doc = Nokogiri::HTML(open(site))
    end
    
    def self.region_array
        array = @@doc.css("div.entry-content h1").map do |region|
            region.text
        end
        @@region_array = array
    end

    def self.winery_array
        array = @@doc.css("div.entry-content p a b").map do |winery|
            winery.text
        end
        @@winery_array = array
    end

    def self.winery_info_array
        array = @@doc.css("div.entry-content p").map do |info|
            info.text
        end
        # remove \n from info and replace with :
        modified_array = array.map do |info|
            info.gsub("\n", ": ")
        end
        @@winery_info_array = modified_array
    end
end



        
        
   




# s = TopCAWineries::Scraper.new