class TopCAWineries::CLI

    REVIEWS_URL = "https://thepress.sfchronicle.com/review/"

    def call
        puts "Welcome to TopCAWineries! Let's learn about some of the best California wineries."
        puts "\n"
        # puts <<-DOC.gsub /^\s*/, ""
        #     Pick a Region from below to see all the best wineries there.
        #     1. Mendocino County
        #     2. Sonoma County
        #     3. Napa Valley
        #     4. East Bay and Livermore
        #     5. Monterey and the Santa Cruz Mountains
        #     6. Paso Robles and San Luis Obispo County
        # DOC
        puts "Pick a Region from below to see all the best wineries there."
        TopCAWineries::Scraper.scrape
        # TopCAWineries::Scraper.region_array
        region_array = TopCAWineries::Scraper.region_array
        region_array.each_with_index do |region, i|
            puts "#{i + 1}. #{region}"
        end

        sleep 2

        display_wineries
        
        display_winery_info
        next_action?
    end
              
       

    def display_wineries
        puts "Enter the region number:"
        input = gets.chomp.to_i
        puts "\n \n"

        case input
        when 1
            puts "Here are some of the best wineries in Mendocino County"
            puts "\n"
            puts <<-DOC.gsub /^\s*/, ""
            1. Campovida
            2. Drew
            3. Foursight
            4. Longmeadow Ranch
            5. Pennyroyal Farm
            6. Phillips Farm
            7. Roederer
            8. Terra Saviaclear
        DOC
        
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
    
           
        
      
        
        
        
        
        
    
        
    
        
        

         
    
    
  
        
   

        

    

