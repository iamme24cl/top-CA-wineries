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
            display_wineries("Mendocino County")
            # Display description of wineries
            details_input = nil
            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region_wineries_info("Mendocino County")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    not_an_option
                end
            end
            
        when 2
            display_wineries("Sonoma County")
            # Display description of wineries
            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region_wineries_info("Sonoma County")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    not_an_option
                end
            end
         
        when 3
            display_wineries("Napa Valley")
            # Display description of wineries
            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region_wineries_info("Napa Valley")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    not_an_option
                end
            end

        when 4
            display_wineries("East Bay")
            # Display description of wineries
            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region_wineries_info("East Bay")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    not_an_option
                end
            end

        when 5
            display_wineries("Monterey County and Santa Cruz Mountains")
            # Display description of wineries
            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region_wineries_info("Monterey County and Santa Cruz Mountains")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    not_an_option
                end
            end

        when 6
            display_wineries("Paso Robles and and San Luis Obispo County")
            # Display description of wineries
            while details_input != 'yes'
                details_input = gets.strip.downcase

                if details_input == 'yes'
                    display_region_wineries_info("Paso Robles and and San Luis Obispo County")
                elsif details_input == 'exit'
                    bye
                    exit
                else
                    not_an_option
                end
            end

        else
            puts "That is not a valid input. Type in the region number you would like to view.".colorize(:red)
            create_and_display_wineries
        end
    end

    def not_an_option
       puts "That was not an option. Please type 'yes' or 'exit'!" 
    end

    # Display winery-info hepler methods
    
    def display_wineries(name)
        puts "Here are some of the best wineries in #{name}"
        puts "\n"

        TopCAWineries::WineRegion.all.find {|region| region.name.downcase == name.downcase}.wineries.each.with_index(1) do |winery, i|
            puts "#{i}. #{winery.name.colorize(:green)}"
        end

        puts "\n"
        puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
        puts "\n"
    end

    def display_region_wineries_info(name)
        wineries = TopCAWineries::WineRegion.all.find{|region| region.name.downcase == name.downcase}.wineries
        puts "\n"
        puts "Please enter the number of the winery you would like to view:"

        num = ""
        until num.is_a?(Integer) && num > 0 && num < wineries.size
            num = gets.strip.to_i
            puts "/n"
            puts "Winery not found, please select a valid winery number!"
        end
        show_winery = wineries[num - 1]
        puts "\n"
        puts show_winery.description.colorize(:red)
        puts "\n"
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
    
       


        

       

   
        


    
       

           

            
            
        
        
        
       


        
    
    



            
           
            
            


            
    
           
        
      
        
        
        
        
        
    
        
             
    
        
        

        
    

         
    
    
  
        
   

        
              

    

