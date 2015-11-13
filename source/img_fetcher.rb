require 'nokogiri'
require 'curb'

class Img_fetcher

  URL = 'http://bindingofisaacrebirth.gamepedia.com'

  def fetch
    parse('/Items', '//div[@id="headertabs"]//a[@class="image"]/img')
    parse('/Trinkets', '//table[@class="mw-collapsible wikitable striped trinkets"]//a[@class="image"]/img')
  end
  
  private

  def parse(url, path)
    imgs = Nokogiri::HTML(Curl.get(URL + url).body).xpath(path)
    imgs.map do |img|
      img_name = img.xpath('./@alt').text.gsub(/( Icon)|(\')/,'').gsub(/[ \/]/, '_').strip
      img_url = img.xpath('./@src').text.strip
      unless File.exist?("./images/#{img_name}")
        File.open("./images/#{img_name}", 'w') { |file| file << Curl.get(img_url).body }
      end
    end
  end

end

Img_fetcher.new.fetch
