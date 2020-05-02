class DeathSpider < Kimurai::Base
  @name = 'deaths_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//table>tbody>tr>td").each do |death|
      item = {}

      item[:title]      = death.css('a.blue-hover>span').text
      item[:age]      = death.css('a.blue-hover>span.age').text
      item[:lieu] = death.css('span.blue-hover').text

      Death.where(item).first_or_create
    end
  end
end