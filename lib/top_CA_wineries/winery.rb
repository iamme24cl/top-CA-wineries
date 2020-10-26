class TopCAWineries::Winery
    
    attr_accessor :name, :description

    @@all = []

    def initialize(winery)
        self.name = winery
        save
    end
        
    def self.create_from_collection(winery_array)
        winery_array.each do |winery|
            TopCAWineries::Winery.new(winery)
        end
    end

    def self.check_and_create_from_collection(winery_array)
        if self.all == []
            create_from_collection(winery_array)
            add_winery_descriptions
        end
    end

    def self.add_winery_descriptions
        i = 0
        self.all.each do |winery|
            winery.description = TopCAWineries::Scraper.winery_info_array[i]
            i = i + 1
        end
    end

    def self.wineries_by_region
        region_wineries = []
        region_wineries << all[0..6] # Mendocino
        region_wineries << all[7..18] # Sonoma
        region_wineries << all[19..29] # Napa
        region_wineries << all[30..35] # East Bay
        region_wineries << all[36..40] # Monterey
        region_wineries << all[41..50] # Paso Robles
        region_wineries
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
           
        
        

        
     
