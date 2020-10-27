class TopCAWineries::CLI

    REVIEWS_URL = "https://thepress.sfchronicle.com/review"

    def call
        puts "Welcome to TopCAWineries!".colorize(:green) 
        puts "Let's check out some of the best wineries in California."
        puts "\n"

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
        puts "Pick a Region from below to see a list of wineries there."
        puts "\n"
        
        TopCAWineries::WineRegion.check_and_create_from_collection(TopCAWineries::Scraper.region_array)
        
        display_region = TopCAWineries::WineRegion.all
        display_region.each.with_index(1) do |region, i|
            puts "#{i}. #{region.name.colorize(:red)}"
        end
    end
    
    
    def create_and_display_wineries
        TopCAWineries::Winery.check_and_create_from_collection(TopCAWineries::Scraper.winery_array)
        # add wineries and their descriptions to each Region
        TopCAWineries::WineRegion.add_wineries 
        puts "\n"
        
        puts "Enter the region number:"
        region_input = gets.strip.to_i       
        puts "\n"
        
        case region_input
        when 1
            puts "Here are some of the best wineries in Mendocino County"
            puts "\n"
            display_mendocino = TopCAWineries::WineRegion.all[0].wineries
            display_mendocino.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)

            details_input = nil
            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region("Mendocino County")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    puts "That was not an option. Please type 'yes' or 'exit'!"
                end
            end
            
        when 2
            puts "Here are some of the best wineries in Sonoma County"
            puts "\n"
            display_sonoma = TopCAWineries::WineRegion.all[1].wineries
            display_sonoma.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)

            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region("Sonoma County")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    puts "That was not an option. Please type 'yes' or 'exit'!"
                end
            end
         
        when 3
            puts "Here are some of the best wineries in Napa Valley"
            puts "\n"
            display_napa = TopCAWineries::WineRegion.all[2].wineries
            display_napa.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)

            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region("Napa Valley")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    puts "That was not an option. Please type 'yes' or 'exit'!"
                end
            end

        when 4
            puts "Here are some of the best wineries in East Bay and Livermore"
            puts "\n"
            display_east_bay = TopCAWineries::WineRegion.all[3].wineries
            display_east_bay.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)

            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region("East Bay")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    puts "That was not an option. Please type 'yes' or 'exit'!"
                end
            end

        when 5
            puts "Here are some of the best wineries in Monterey and the Santa Cruz Mountains"
            puts "\n"
            display_monterey = TopCAWineries::WineRegion.all[4].wineries
            display_monterey.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:magenta)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)

           while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region("Monterey County and Santa Cruz Mountains")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    puts "That was not an option. Please type 'yes' or 'exit'!"
                end
            end

        when 6
            puts "Here are some of the best wineries in Paso Robles and San Luis Obispo County"
            puts "\n"
            display_paso_robles = TopCAWineries::WineRegion.all[5].wineries
            display_paso_robles.each.with_index(1) do |winery, i|
                puts "#{i}. #{winery.name.colorize(:green)}"
            end
            puts "\n"
            puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)

            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region("Paso Robles and and San Luis Obispo County")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    puts "That was not an option. Please type 'yes' or 'exit'!"
                end
            end

        else
            puts "That is not a valid input. Type in the region number you would like to view.".colorize(:red)
            create_and_display_wineries
        end
    end

    # Display winery-info hepler methods
    def display_region(name)
        TopCAWineries::WineRegion.all.find {|region| region.name.downcase == name.downcase}.wineries.each.with_index(1) do |winery, i|
            puts "#{i}. #{winery.description.colorize(:cyan)}"
            puts "\n"
        end
    end

    # prompt user to return to the main menu or exit
    def next_action?
        puts "You can find more information and reviews about these wineries at #{REVIEWS_URL.colorize(:green)}"
        puts "\n"
        puts "Are you done? Type 'exit' to leave the program or hit any key to see main menu.".colorize(:red)
        @input = gets.strip.downcase
    end

    def bye
        puts "See you! Have a good one!"
    end
end
    
       


        

       

   
        


    
       

           

            
            
        
        
        
       


        
    
    



            
           
            
            


            
    
           
        
      
        
        
        
        
        
    
        
             
    
        
        

        
    

         
    
    
  
        
   

        
              

    

