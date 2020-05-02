class DeathsController < InheritedResources::Base

  def index
    @deaths = Death.all
  end


  def scrape
    require 'openssl'
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.simplifia.fr/avis-de-deces/derniers-avis-de-deces-publies'))

    entries = doc.css('.card')
    rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
    @formattedrate = rate
    render template: 'deaths/scrape'
  end

  private

    def death_params
      params.require(:death).permit(:Name, :Age, :Lieu)
    end

end
