class TopCAWineries::WineRegion
    attr_accessor :name, :wineries
    @@all = []

    def initialize(name)
        @name = name
        save
    end


    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_or_find_by_name
    end
end