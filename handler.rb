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
    # request.headers['Cookie'] = "__cfduid=d609c8aca747016636cac23c9f02608d41447261602; network_session=oz3kkykyhtB750j95xin2IFCDz45CDuCjcoPH0UWIoXZ3mHcPQUEjRI2TrArLGxo9v0RkE%2FuWJ2UyMKBWUI9ZMkVBStabPKb1coAcJnudPh9XWrVqlrSAtanHJkqHb7DB8%2BqooVCoLLg9PBo%2Bso%2BeaL5fv3pXUclzY0279y0gcA%3D%7CVLRE%2B4cAv6QESVpFPE8FeGgp7ARHnSvHatLYTKuzVpI%3D; cdmu=1; cdmua=1447261611147; __utma=23258028.821811448.1447261613.1447782595.1447790525.5; __utmz=23258028.1447790525.5.3.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); cdmblk=0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0; __utmb=23258028.12.9.1447790810049; __utmc=23258028; __utmt=1; __utmt_b=1; __utmt_c=1; bknx_fa=1447790525903; bknx_ss=1447790525903"
    # request.headers['Cookie'] = "__cfduid=d301b00ebb72beb49e6892bb0445e63951448261037; network_session=oegdneiQGRxhOStoqzC7de72GWprirvEr2o0p0LCy9mrVJDGO689PVND3P11mydSYklw27OdgdHfDyvQ8b4iUlDxr2JfuJr6zuhNKg96JXfZBHhTuaP9lYjSJiEIIBDage84NbEfl71jtheQ5IhDGlTceb4ntMKTlhpHBRsc1pg%3D%7CiCfq8dsssgvkVbolOkURPieeofhWhBW4HNezAgANA6s%3D; __utma=23258028.212011064.1448437054.1448444337.1448447480.3; __utmz=23258028.1448437054.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); cdmblk=0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0; cdmblk2=0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0,0:0:0:0:0:0:0:0:0:0:0; cdmtlk=12652:12652:12652:12652:12652:12652:12652:12652; cdmgeo=us; cdmbaserate=2.5; cdmbaseraterow=1.5; cdmua=1448447479012; __utmc=23258028; __utmb=23258028.4.9.1448447480; __utmt=1; __utmt_b=1; __utmt_c=1"
  end
  c.perform
  Nokogiri::HTML(c.body)
end
