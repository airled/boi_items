require 'curb'

class Cookies_fetcher

  URL = 'http://bindingofisaacrebirth.gamepedia.com/item'
  AGENT = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'

  def run
    cookies = get_cookies(URL)
    File.open('./cookies' , 'w') { |file| file << cookies }
    puts "\e[32mCookies got.\e[0m"
  end

  private

  def get_cookies(url, cookies = nil)
    c = Curl::Easy.new(url) do |req|
      req.headers["User-Agent"] = AGENT
    end
    c.perform
    header_value(c.head, 'Set-Cookie')
  end

  def header_value(head, header)
    head.split("\r\n").select { |part| part.include?("#{header}") }.map { |header| header.split(';').first }.flatten.join(';').gsub("#{header}: ", '')
  end
  
end
