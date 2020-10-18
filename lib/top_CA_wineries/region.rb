class TopCAWineries::WineRegion
    attr_accessor :name
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
            self.create_from_collection(region_array)
        else
            self.all
        end
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end