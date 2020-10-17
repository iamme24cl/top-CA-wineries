class TopCAWineries::Winery
    attr_accessor :name, :region, :description
    @@all = []

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end