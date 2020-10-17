class TopCAWineries::Scraper
    attr_accessor :path

    def initialize
        
    end
        
        
    def self.scrape
        site = "https://thepress.sfchronicle.com/article/52-california-wineries-2019/" 
        doc = Nokogiri::HTML(open(site))
    end
   

end



