class TopCAWineries::WineRegion
    attr_accessor :name, :wineries
    @@all = []

    def initialize(region_array)
        region_array.each do |region|
            self.name = region
        end
        save      
    end


    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_from_collection(region_array)
        region_array.each do |region|
            TopCAWineries::WineRegion.new(region_array)
        end
    end
end