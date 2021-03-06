class TopCAWineries::Scraper
    
    def self.scrape_page
        site = "https://thepress.sfchronicle.com/article/52-california-wineries-2019/" 
        @@doc = Nokogiri::HTML(open(site))
    end
    
    def self.region_array
        @@doc.css("div.entry-content h1").map do |region|
            region.text
        end
    end

    def self.winery_array
        @@doc.css("div.entry-content p a b").map do |winery|
            winery.text
        end
    end
        
    def self.winery_info_array
        modified_array = @@doc.css("div.entry-content p").map do |info|
            # remove \n from info and replace with :
            info.text.gsub("\n", ": ")
        end
        modified_array.delete_if {|info| info.include?("Long Meadow Ranch")}

        winery_info_array = []
        winery_info_array << modified_array[11..17] # Mendocino
        winery_info_array << modified_array[20..31] # Sonoma
        winery_info_array << modified_array[34..44] # Napa
        winery_info_array << modified_array[47..52] # East Bay
        winery_info_array << modified_array[55..59] # Monterey
        winery_info_array << modified_array[63..72] # Paso Robles 
        
        winery_info_array.flatten!
    end
end
        


      
  
   
   
        



        
        
   




