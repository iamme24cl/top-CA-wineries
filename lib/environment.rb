require_relative "./top_CA_wineries/version"
require_relative "./top_CA_wineries/scraper"
require_relative "./top_CA_wineries/cli"
require_relative "./top_CA_wineries/region"
require_relative "./top_CA_wineries/winery"
require 'nokogiri'
require 'open-uri'
# require 'pry'


module TopCAWineries
  class Error < StandardError; end
  # Your code goes here...
end
