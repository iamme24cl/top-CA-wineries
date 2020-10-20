class TopCAWineries::WineRegion
    attr_accessor :name, :winery_descriptions
    @@all = []
    @@descriptions = []

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
            self.create_from_collection(region_array)
        else
            self.all
        end
    end

    def self.create_winery_descriptions
        descriptions = TopCAWineries::Scraper.winery_info_array 
        if @@descriptions == []
            self.all[0].winery_descriptions = descriptions[0]
            self.all[1].winery_descriptions = descriptions[1]
            self.all[2].winery_descriptions = descriptions[2]
            self.all[3].winery_descriptions = descriptions[3]
            self.all[4].winery_descriptions = descriptions[4]
            self.all[5].winery_descriptions = descriptions[5]
        end
    end
              
    def save
        @@all << self
    end

    def self.all
        @@all
    end
end

  

