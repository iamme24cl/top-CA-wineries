class TopCAWineries::WineRegion
    attr_accessor :name, :wineries
    @@all = []

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end