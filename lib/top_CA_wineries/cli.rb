class TopCAWineries::CLI

    REVIEWS_URL = "https://thepress.sfchronicle.com/review"

    def call
        create_and_display_regions
        create_and_display_wineries
        next_action?
    end
        
    def create_and_display_regions
        puts "Welcome to TopCAWineries!" 
        puts "Let's learn about some of the best wineries in California."
        puts "\n"
        puts "Pick a Region from below to see a list of wineries there."
        puts "\n"
        
        region_array = TopCAWineries::Scraper.region_array
        TopCAWineries::WineRegion.check_and_create_from_collection(region_array)
        
        display_region = TopCAWineries::WineRegion.all
        display_region.each.with_index(1) do |region, i|
            puts "#{i}. #{region.name.colorize(:red)}"
        end
    end

    def create_and_display_wineries
        winery_array = TopCAWineries::Scraper.winery_array
        TopCAWineries::Winery.check_and_create_from_collection(winery_array)
        wineries = TopCAWineries::Winery.all

        descriptions = TopCAWineries::WineRegion.winery_descriptions
        
        puts "\n"
        puts "Enter the region number:"
        input = gets.strip.to_i       
        puts "\n"
        
        case input
        when 1
            puts "Here are some of the best wineries in Mendocino County"
            puts "\n"
            display_mendocino = wineries[0..6]
            display_mendocino.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[0]
                display_winery_info.delete_if {|description| description.include?("Long Meadow Ranch")}
                display_winery_info.each.with_index(1) do |info, i|
                    puts "#{i}. #{info.colorize(:red)}"
                    puts "\n"
                end
            elsif input == 'n'
                exit
            end
            
        when 2
            puts "Here are some of the best wineries in Sonoma County"
            puts "\n"
            display_sonoma = wineries[7..18]
            display_sonoma.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[1]
                display_winery_info.each.with_index(1) do |info, i|
                    puts "#{i}. #{info.colorize(:red)}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end
         
        when 3
            puts "Here are some of the best wineries in Napa Valley"
            puts "\n"
            display_napa = wineries[19..29]
            display_napa.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[2]
                display_winery_info.each.with_index(1) do |info, i|
                    puts "#{i}. #{info.colorize(:red)}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end

        when 4
            puts "Here are some of the best wineries in East Bay and Livermore"
            puts "\n"
            display_east_bay = wineries[30..35]
            display_east_bay.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[3]
                display_winery_info.each.with_index(1) do |info, i|
                    puts "#{i}. #{info.colorize(:red)}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end

        when 5
            puts "Here are some of the best wineries in Monterey and the Santa Cruz Mountains"
            puts "\n"
            display_monterey = wineries[36..40]
            display_monterey.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[4]
                display_winery_info.each.with_index(1) do |info, i|
                    puts "#{i}. #{info.colorize(:red)}"
                    puts "\n"
                end
            elsif input == 'n'
                call
            end
        else
            puts "Here are some of the best wineries in Paso Robles and San Luis Obispo County"
            puts "\n"
            display_paso_robles = wineries[41..50]
            display_paso_robles.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want to know about these wineries?? Type 'y' for yes or 'n' to go back to the main menu:"
            input = gets.strip.downcase
            if input == 'y'
                display_winery_info = descriptions[5]
                display_winery_info.each.with_index(1) do |info, i|
                    puts "#{i}. #{info.colorize(:red)}"
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
        puts "Type 'y' for yes or type 'n' to exit the program:".colorize(:light_magenta)

        learn_again = gets.strip.downcase
        puts "\n"

        unless learn_again == 'n'
            call
        end               
    end
end
        
        
        
       


        
    
    



            
           
            
            


            
    
           
        
      
        
        
        
        
        
    
        
             
    
        
        

        
    

         
    
    
  
        
   

        
              

    

