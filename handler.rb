# class Cookies_keeper

#   attr_accessor :cookies

#   def get_cookies
#     url = 'http://bindingofisaacrebirth.gamepedia.com'
#     request = Curl.get(url)
#     self.cookies = request.head.split("\r\n").select { |part| part.include?('Set-Cookie') }.first.to_s.gsub('Set-Cookie: ','')
#   end

# end

# keeper = Cookies_keeper.new
# keeper.get_cookies
# COOKIES = keeper.cookies

def get_item(row)
  name = row.xpath('.//td[1]/a/@title').text
  desc = row.xpath('.//td[3]').text
  {name: name, desc: desc}
end

def get_html(url)
  c = Curl::Easy.new(url) do |request|
    # request.headers['Cookie'] = COOKIES
    request.headers['Cookie'] = "__cfduid=d81b65191ca875daa10015332411434a81449400361; network_session=P1ZWIh0xCl2vqOyBhxZy%2FND0ayJibcy1owBg5aY%2FzL5SWej5toToRmb%2B%2FqFUPmBMknCljKqCqvn8MTJxnEf1e6e27tx6brtxTzAYHURfS9rfyg7MT1s6R0EBM4PcWNMx9y8wRP4Mldj1hUTHFXkXVMboHjsT250mgw7TSInDEpg%3D%7CpzGQWCNOFGqTip1fA2iiLf2ttJ7wJs9XVkYM6Rv1aXs%3D; cdmua=1449400388245; cdmblk=0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0; __utma=23258028.986341314.1449400396.1449400396.1449400396.1; __utmc=23258028; __utmz=23258028.1449400396.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); bknx_fa=1449400397790; bknx_ss=1449400397790; cdmtlk=6403:6403:6403:6403:6403:100:6403:6403; cdmgeo=by; cdmbaserate=2.5; cdmbaseraterow=1.5"
  end
  c.perform
  Nokogiri::HTML(c.body)
end
