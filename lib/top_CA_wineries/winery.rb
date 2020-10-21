class TopCAWineries::Winery
    
    attr_accessor :name

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
         create_from_collection(winery_array) if self.all == []
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
           
        
        

        
     
