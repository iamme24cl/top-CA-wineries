Top CA Wineries:

1. Displays a greeting and a list of Wine regions and asks user to select from the wine region
2. Get user input
3. Display the wineries in the region requested by the user
4. Ask user which winery they would like more information on
5. Get user input
6. Display the information on the winery that the user requested
5. Ask user if they would like to go back to the main region menu or exit

# Scrape data at:
1. url: "https://thepress.sfchronicle.com/article/52-california-wineries-2019/"
2. reviews_url: "https://thepress.sfchronicle.com/review/"
3. Region names: doc.css("div.entry-content h1")
4. Winery names: doc.css("div.entry-content p a b")
5. Winery information: doc.css("div.entry-content p") 
    - Wine info array
    a. Mendocino: [11..18]
    b. Sonoma: [21..32]
    c. Napa Valley: [35..45]
    d. East Bay: [48..53]
    e. Monterey: [56..60]
    f. Paso Robles: [64..73]