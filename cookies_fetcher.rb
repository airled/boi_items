require 'curb'

class Cookies_fetcher

  URL = 'http://bindingofisaacrebirth.gamepedia.com/Item'
  AGENT = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'

  def run
    params1 = request(URL)
    cookies1 = params1[:got_cookies]
    redirect1 = params1[:redirect_url]

    params2 = request(redirect1)
    cookies2 = params2[:got_cookies]
    redirect2 = params2[:redirect_url]

    params3 = request(redirect2, cookies1)
    cookies3 = params3[:got_cookies].split(';').first
    redirect3 = params3[:redirect_url]

    params4 = request(redirect3, cookies1 + ';' + cookies3)
    redirect4 = params4[:redirect_url]

    File.open('./cookies' , 'w') { |file| file << cookies1 + ';' + cookies3 }

    puts 'Cookies got.'
  end

  private

  def request(url, cookies = nil)
    c = Curl::Easy.new(url) do |req|
      req.headers["User-Agent"] = AGENT
      req.headers["Cookie"] = cookies if cookies
    end
    c.perform
    redirect_url = header_value(c.head, 'Location')
    got_cookies = header_value(c.head, 'Set-Cookie')
    {redirect_url: redirect_url, got_cookies: got_cookies}
  end

  def header_value(head, header)
    head.split("\r\n").select { |part| part.include?("#{header}") }.map { |header| header.split(';').first }.flatten.join(';').gsub("#{header}: ", '')
  end
  
end
