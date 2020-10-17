class TopCAWineries::CLI
    def call
        greet_and_display
        display_wineries
        display_winery_info
        next_action?
    end
        


    def greet_and_display
        puts <<-DOC.gsub /^\s*/, ""
            Welcome to TopCAWineries! Let's learn about some of the best California wineries.
            Pick a Region from below to see all the best wineries there.
            1. Mendocino County
            2. Sonoma County
            3. Napa Valley
            4. East Bay and Livermore
            5. Monterey and the Santa Cruz Mountains
            6. Paso Robles and San Luis Obispo County
        DOC
    end

    def display_wineries
        puts <<-DOC.gsub /^\s*/, ""
            Enter the number of the region you would like to see wineries in:
        DOC
       
        input = gets.strip.to_i
    
        if input == 1
            puts <<-DOC.gsub /^\s*/, ""
                1. Campovida
                2. Drew
                3. Foursight
                4. Longmeadow Ranch
                5. Pennyroyal Farm
                6. Phillips Farm
                7. Roederer
                8. Terra Savia
            DOC
        end
    end

    def display_winery_info
        puts "Enter the number of the winery you would like more info on:"
        input = gets.strip.to_i
        if input == 1
            puts "Campovida: shf;aehf;asdhfasdhf;asdhfsadohf"
        end
    end

    def next_action?
        # Ask user if they would like to go back to the previous winery menu or the main region menu or exit
        
    end
        
        
end
        

    

