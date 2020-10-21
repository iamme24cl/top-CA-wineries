class TopCAWineries::CLI

    REVIEWS_URL = "https://thepress.sfchronicle.com/review"

    def call
        TopCAWineries::Scraper.scrape_page
        @input = nil
        until @input == "exit"
            create_and_display_regions
            create_and_display_wineries
            next_action?
        end
        bye
    end
        
    def create_and_display_regions
        puts "Welcome to TopCAWineries!".colorize(:green) 
        puts "Let's check out some of the best wineries in California."
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

        TopCAWineries::WineRegion.create_winery_descriptions
        
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
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
            input = gets.strip.downcase

            if input == 'yes'
                display_region_mendocino
            elsif input == 'exit'
                puts "See you! Have a good one!"
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
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
            input = gets.strip.downcase

            if input == 'yes'
                display_region_sonoma
            elsif input == 'exit'
                puts "See you! Have a good one!"
                exit
            end
         
        when 3
            puts "Here are some of the best wineries in Napa Valley"
            puts "\n"
            display_napa = wineries[19..29]
            display_napa.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
            input = gets.strip.downcase

            if input == 'yes'
                display_region_napa
            elsif input == 'exit'
                puts "See you! Have a good one!"
                exit
            end

        when 4
            puts "Here are some of the best wineries in East Bay and Livermore"
            puts "\n"
            display_east_bay = wineries[30..35]
            display_east_bay.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
            input = gets.strip.downcase

            if input == 'yes'
                display_region_eastbay
            elsif input == 'exit'
                puts "See you! Have a good one!"
                exit
            end

        when 5
            puts "Here are some of the best wineries in Monterey and the Santa Cruz Mountains"
            puts "\n"
            display_monterey = wineries[36..40]
            display_monterey.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
            input = gets.strip.downcase

            if input == 'yes'
                display_region_monterey
            elsif input == 'exit'
                puts "See you! Have a good one!"
                exit
            end

        else
            puts "Here are some of the best wineries in Paso Robles and San Luis Obispo County"
            puts "\n"
            display_paso_robles = wineries[41..50]
            display_paso_robles.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
            input = gets.strip.downcase

            if input == 'yes'
                display_region_pasorobles
            elsif input == 'exit'
                puts "See you! Have a good one!"
                exit
            end
        end
        puts " You can find more information and reviews about these wineries at #{REVIEWS_URL.colorize(:green)}"
        puts "\n"
    end

    def display_region_mendocino
        display_winery_info = TopCAWineries::WineRegion.all[0].winery_descriptions
        display_winery_info.delete_if {|description| description.include?("Long Meadow Ranch")}
        display_winery_info.each.with_index(1) do |info, i|
            puts "#{i}. #{info.colorize(:cyan)}"
            puts "\n"
        end
    end
    def display_region_sonoma
        display_winery_info = TopCAWineries::WineRegion.all[1].winery_descriptions
        display_winery_info.each.with_index(1) do |info, i|
            puts "#{i}. #{info.colorize(:cyan)}"
            puts "\n"
        end
    end
    def display_region_napa 
        display_winery_info = TopCAWineries::WineRegion.all[2].winery_descriptions
        display_winery_info.each.with_index(1) do |info, i|
            puts "#{i}. #{info.colorize(:cyan)}"
            puts "\n"
        end
    end
    def display_region_eastbay
        display_winery_info = TopCAWineries::WineRegion.all[3].winery_descriptions
        display_winery_info.each.with_index(1) do |info, i|
            puts "#{i}. #{info.colorize(:cyan)}"
            puts "\n"
        end
    end
    def display_region_monterey
        display_winery_info = TopCAWineries::WineRegion.all[4].winery_descriptions
        display_winery_info.each.with_index(1) do |info, i|
            puts "#{i}. #{info.colorize(:cyan)}"
            puts "\n"
        end
    end
    def display_region_pasorobles
        display_winery_info = TopCAWineries::WineRegion.all[5].winery_descriptions
        display_winery_info.each.with_index(1) do |info, i|
            puts "#{i}. #{info.colorize(:cyan)}"
            puts "\n"
        end
    end

    def next_action?
        puts "Are you done? Type 'exit' to leave the program or hit any key to see main menu.".colorize(:red)
        @input = gets.strip.downcase
    end

    def bye
        puts "See you! Have a good one!"
    end
end
    


        

       

   
        


    
       

           

            
            
        
        
        
       


        
    
    



            
           
            
            


            
    
           
        
      
        
        
        
        
        
    
        
             
    
        
        

        
    

         
    
    
  
        
   

        
              

    

