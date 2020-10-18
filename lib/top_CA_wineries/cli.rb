class TopCAWineries::CLI

    REVIEWS_URL = "https://thepress.sfchronicle.com/review"

    def call
        create_and_display_regions
        create_and_display_wineries
        next_action?
    end
        
    def create_and_display_regions
        puts "Welcome to TopCAWineries! Let's learn about some of the best California wineries."
        puts "Pick a Region from below to see a list of wineries there."
        puts "\n"
        
        # TopCAWineries::Scraper.scrape
        region_array = TopCAWineries::Scraper.region_array
        
        display_region = TopCAWineries::WineRegion.create_from_collection(region_array)
        display_region.each_with_index do |region, i|
            puts "#{i + 1}. #{region.colorize(:red)}"
        end

    end
             
    def create_and_display_wineries
        winery_array = TopCAWineries::Scraper.winery_array
        descriptions = TopCAWineries::Winery.descriptions
        
        puts "\n"
        puts "Enter the region number:"
        input = gets.strip.to_i       
        puts "\n"
        
        case input
        when 1
            puts "Here are some of the best wineries in Mendocino County"
            puts "\n"
            mendocino = winery_array[0..6]
            display_medocino = TopCAWineries::Winery.create_from_collection(mendocino)
            display_medocino.each_with_index do |winery, i|
                puts "#{i + 1}. #{winery}"
            end
            puts "\n"
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[11..18]
                display_winery_info.delete_if {|s| s.include?("Long Meadow Ranch")}
                display_winery_info.each_with_index do |info, i|
                    puts "#{i + 1}. #{info}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end
            
        when 2
            puts "Here are some of the best wineries in Sonoma County"
            puts "\n"
            sonoma = winery_array[7..18]
            display_sonoma = TopCAWineries::Winery.create_from_collection(sonoma)
            display_sonoma.each_with_index do |winery, i|
                puts "#{i + 1}. #{winery}"
            end
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[21..32]
                display_winery_info.each_with_index do |info, i|
                    puts "#{i + 1}. #{info}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end
         
        when 3
            puts "Here are some of the best wineries in Napa Valley"
            puts "\n"
            napa = winery_array[19..29]
            display_napa = TopCAWineries::Winery.create_from_collection(napa)
            display_napa.each_with_index do |winery, i|
                puts "#{i + 1}. #{winery}"
            end
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[35..45]
                display_winery_info.each_with_index do |info, i|
                    puts "#{i + 1}. #{info}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end

        when 4
            puts "Here are some of the best wineries in East Bay and Livermore"
            puts "\n"
            east_bay = winery_array[30..35]
            display_east_bay = TopCAWineries::Winery.create_from_collection(east_bay)
            display_east_bay.each_with_index do |winery, i|
                puts "#{i + 1}. #{winery}"
            end
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[48..53]
                display_winery_info.each_with_index do |info, i|
                    puts "#{i + 1}. #{info}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end

        when 5
            puts "Here are some of the best wineries in Monterey and the Santa Cruz Mountains"
            puts "\n"
            monterey = winery_array[36..40]
            display_monterey = TopCAWineries::Winery.create_from_collection(monterey)
            display_monterey.each_with_index do |winery, i|
                puts "#{i + 1}. #{winery}"
            end
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[56..60]
                display_winery_info.each_with_index do |info, i|
                    puts "#{i + 1}. #{info}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end
        else
            puts "Here are some of the best wineries in Paso Robles and San Luis Obispo County"
            puts "\n"
            paso_robles = winery_array[41..50]
            display_paso_robles = TopCAWineries::Winery.create_from_collection(paso_robles)
            display_paso_robles.each_with_index do |winery, i|
                puts "#{i + 1}. #{winery}"
            end
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[64..73]
                display_winery_info.each_with_index do |info, i|
                    puts "#{i + 1}. #{info}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end
        end
        puts " You can find more information and reviews about these wineries at #{REVIEWS_URL.colorize(:green)}"
        puts "\n"
    end
        
    def next_action?
        puts "Would you like see the main menu again?" 
        puts "Type 'y' for yes or type 'n' to exit the program:".colorize(:red)

        learn_again = gets.strip.downcase
        puts "\n"

        unless learn_again == 'n'
            call
        end               
    end
end
        
        
       


        
    
    



            
           
            
            


            
    
           
        
      
        
        
        
        
        
    
        
    
        
        

        
    

         
    
    
  
        
   

        
              

    

