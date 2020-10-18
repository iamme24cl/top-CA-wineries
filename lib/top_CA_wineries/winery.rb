class TopCAWineries::Winery
    attr_accessor :name, :description
    @@all = []
    @@all_description = []

    def initialize(winery_array)
        winery_array.each do |winery|
            self.name = winery
        end
        save
    end

    def self.create_from_collection(winery_array)
        winery_array.each do |winery|
            TopCAWineries::Winery.new(winery_array)
        end
    end

    def self.descriptions
        @@all_description = TopCAWineries::Scraper.winery_info_array
    end

    
    def save
        @@all << self
    end

    def self.all
        @@all
    end

end