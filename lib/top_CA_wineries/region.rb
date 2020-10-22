class TopCAWineries::WineRegion

    attr_accessor :name, :winery_descriptions, :wineries
    
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
        create_from_collection(region_array) if self.all == []
    end
        
    def self.add_attributes
        add_winery_descriptions
        add_wineries
    end
           
    def self.add_winery_descriptions
        i = 0
        self.all.each do |region|
            region.winery_descriptions = TopCAWineries::Scraper.winery_info_array[i]
            i = i + 1
        end
    end

    def self.add_wineries
        i = 0
        self.all.each do |region|
            region.wineries = TopCAWineries::Winery.wineries_by_region[i]
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
       
              
       

  

