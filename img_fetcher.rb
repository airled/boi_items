require 'nokogiri'
require 'curb'
require_relative './handler'

class Img_fetcher

  URL = 'http://bindingofisaacrebirth.gamepedia.com'

  def fetch
    parse('/Items', '//table//a[@class="image"]/img')
    parse('/Trinkets', '//table[@class="mw-collapsible wikitable striped trinkets"]//a[@class="image"]/img')
  end
  
  private

  def parse(url, path)
    imgs = get_html(URL + url).xpath(path)
    imgs.map do |img|
      img_name = img.xpath('./@alt').text.gsub(/( Icon.png)|(\')/, '').gsub(/[ \/]/, '_').gsub(/\./, '@').strip
      img_url = img.xpath('./@src').text.strip
      file_path = File.expand_path("../source/images/#{img_name}.png", __FILE__)
      unless File.exist?(file_path)
        File.open(file_path, 'w') { |file| file << Curl.get(img_url).body }
        puts file_path
      end
    end
  end

end
