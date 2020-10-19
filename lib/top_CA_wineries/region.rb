class TopCAWineries::WineRegion
    attr_accessor :name
    @@all = []
    @@all_winery_descriptions = []

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

    def self.winery_descriptions
        @@all_winery_descriptions = TopCAWineries::Scraper.winery_info_array
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
  

