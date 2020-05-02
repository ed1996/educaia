class PagesController < ApplicationController

  def home
    require 'openssl'
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.simplifia.fr/avis-de-deces/derniers-avis-de-deces-publies'))

    @entries = doc.css('a.blue-hover')


#    @entries.each do |rate|
#      @death = {
#          nom: rate.css('span').text
#      }

#   end

#    @formattedrate = @death[:nom]
  end

  def scrape

  end

end
