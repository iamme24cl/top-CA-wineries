class TopCAWineries::CLI

    REVIEWS_URL = "https://thepress.sfchronicle.com/review/"

    def call
        puts "Welcome to TopCAWineries! Let's learn about some of the best California wineries."
        puts "\n"
        
        puts "Pick a Region from below to see all the best wineries there."
        TopCAWineries::Scraper.scrape
        # TopCAWineries::Scraper.region_array
        region_array = TopCAWineries::Scraper.region_array
        # region_array.each_with_index do |region, i|
        #     puts "#{i + 1}. #{region}"
        # end
        display_region = TopCAWineries::WineRegion.create_from_collection(region_array)
        display_region.each_with_index do |region, i|
            puts "#{i + 1}. #{region}"
        end
        puts "\n" 
        sleep 2

        display_wineries
        
        display_winery_info
        next_action?
    end
              
       

    def display_wineries
        # TopCAWineries::Scraper.scrape
        winery_array = TopCAWineries::Scraper.winery_array[0..6]
        # TopCAWineries::Winery.create_from_collection(winery_array)
        puts "Enter the region number:"
        input = gets.chomp.to_i
        puts "\n \n"

        case input
        when 1
            puts "Here are some of the best wineries in Mendocino County"
            puts "\n"
            display_medocino = TopCAWineries::Winery.create_from_collection(winery_array)
            display_medocino.each_with_index do |winery, i|
                puts "#{i + 1}. #{winery}"
            end
            
        when 2
            puts "Sonoma"
        when 3
            puts "Napa"
        when 4
            puts "East Bay"
        when 5
            puts "Monterey"
        else
            puts "Paso Robles"
        end
        puts "\n"
    end

        
    
    def display_winery_info
        puts "Enter the number of the winery you would like more info on:"
        input = gets.strip.to_i
        case input 
        when 1
            puts "Campovida: You can taste the Campovida wines at the winery’s tasting bar near Jack London Square in Oakland,\n
            but if you’re driving north it’s worth stopping at the bucolic winery in Hopland, where you can wander among many\n
            acres of trees with a glass of wine in hand. This would be a great place for a picnic. While you’re in the area,\n
            consider stopping at the owners’ nearby restaurant and inn, Piazza de Campovida."
            puts "More information and reviews for this winery can be found at: #{REVIEWS_URL}campovida"
        when 2
            puts "Drew: Jason and Molly Drew make some of the best wines in Mendocino County, and they’re\n
            known — rightfully so — for their gamey, meaty Syrah. Visit their small, storefront tasting room in the Madrones\n
            complex in Philo, near the deep end of Anderson Valley, though many of their wines come from outside of this\n
            Pinot-centric valley. The Valenti Ranch Syrah is a special treat."
            puts "More information and reviews for this winery can be found at: #{REVIEWS_URL}drew"
        end
        puts "\n"
    end

    def next_action?
        puts "Would you like see the main menu again?" 
        puts "Type 'y' for yes or type 'n' to exit the program"

        # def next_action?
        #     # Ask user if they would like to go back to the previous winery menu or the main region menu or exit
        learn_again = gets.chomp.downcase
        puts "\n"

        while learn_again == 'y'
            call
            if learn_again == 'n'
                break
            else
                break
            end
        end               
    end
end
    
           
        
      
        
        
        
        
        
    
        
    
        
        

         
    
    
  
        
   

        

    

