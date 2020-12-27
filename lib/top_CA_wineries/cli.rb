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
          region_name = "Mendocino County"  
          winery_info(region_name)

        when 2
            region_name = "Sonoma County"  
            winery_info(region_name)
                     
        when 3
            region_name = "Napa Valley"  
            winery_info(region_name)
           
        when 4
            region_name = "East Bay"  
            winery_info(region_name)
            
        when 5
            region_name = "Monterey County and Santa Cruz Mountains"  
            winery_info(region_name)

        when 6
            region_name = "Paso Robles and and San Luis Obispo County"  
            winery_info(region_name)
            
        else
            puts "That is not a valid input. Type in the region number you would like to view.".colorize(:red)
            create_and_display_wineries
        end
    end

    # Helper Methods

    def winery_info(region_name)
        display_wineries(region_name)

        puts "\n"
        puts "Want some details about these wineries?? Type 'yes' to continue or 'exit' to leave the program:".colorize(:red)
        input = ""
        until input == 'yes' || input == 'exit'
            input = gets.strip.downcase
            not_an_option
        end
             
        if input == 'yes'
            # Display description of wineries
            display_region_wineries_info(region_name)
        elsif input == 'exit'
            bye
            exit
        end
    end
    
    def display_wineries(name)
        puts "Here are some of the best wineries in #{name}"
        puts "\n"
        
        TopCAWineries::WineRegion.all.find {|region| region.name.downcase == name.downcase}.wineries.each.with_index(1) do |winery, i|
            puts "#{i}. #{winery.name.colorize(:green)}"
        end
    end
    
    def display_region_wineries_info(name)
        TopCAWineries::WineRegion.all.find {|region| region.name.downcase == name.downcase}.wineries.each.with_index(1) do |winery, i|
            puts "#{i}. #{winery.description.colorize(:cyan)}"
            puts "\n"
        end
    end

    def not_an_option
       puts "That was not an option. Please type 'yes' or 'exit'!" 
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

       


        

       

   
        


    
       

           

            
            
        
        
        
       


        
    
    



            
           
            
            


            
    
           
        
      
        
        
        
        
        
    
        
             
    
        
        

        
    

         
    
    
  
        
   

        
              

    

