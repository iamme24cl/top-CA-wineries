class TopCAWineries::WineRegion

    attr_accessor :name, :winery_descriptions
    
    @@all = []

    def initialize(region)
        self.name = region
        save      
    end

    def self.create_from_collection(region_array)
        region_array.each do |region|
            TopCAWineries::WineRegion.new(region)
        end
    end

    def self.check_and_create_from_collection(region_array)
        if self.all == []
            create_from_collection(region_array)
            create_winery_descriptions
        end
    end

    def self.create_winery_descriptions
        descriptions = TopCAWineries::Scraper.winery_info_array 
        i = 0
        self.all.each do |region|
            region.winery_descriptions = descriptions[i]
            i = i + 1
        end
    end
        
    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
              
       

  

