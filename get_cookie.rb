require 'nokogiri'
require 'curb'

request1 = Curl::Easy.new('http://bindingofisaacrebirth.gamepedia.com/Item') do |request|
  request.headers["User-Agent"] = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'
end
request1.perform
cookies1 = request1.head.split("\r\n").select { |part| part.include?('Set-Cookie') }.first.to_s.gsub('Set-Cookie: ','').split(';').first
redirect1 = request1.head.split("\r\n").select { |part| part.include?('Location') }.first.to_s.gsub('Location: ','')

request2 = Curl::Easy.new(redirect1) do |request|
  request.headers["User-Agent"] = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'
end
request2.perform
cookies2 = request2.head.split("\r\n").select { |part| part.include?('Set-Cookie') }.first.to_s.gsub('Set-Cookie: ','')
redirect2 = request2.head.split("\r\n").select { |part| part.include?('Location') }.first.to_s.gsub('Location: ','')

request3 = Curl::Easy.new(redirect2) do |request|
  request.headers["User-Agent"] = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'
  request.headers["Cookie"] = cookies1
end
request3.perform
cookies3 = request3.head.split("\r\n").select { |part| part.include?('Set-Cookie') }.first.to_s.gsub('Set-Cookie: ','').split(';').first
redirect3 = request3.head.split("\r\n").select { |part| part.include?('Location') }.first.to_s.gsub('Location: ','')

request4 = Curl::Easy.new(redirect3) do |request|
  request.headers["User-Agent"] = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'
  request.headers["Cookie"] = cookies1 +';' + cookies3
end
request4.perform
redirect4 = request4.head.split("\r\n").select { |part| part.include?('Location') }.first.to_s.gsub('Location: ','')

# request5 = Curl::Easy.new(redirect4) do |request|
#   request.headers["User-Agent"] = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'
#   request.headers["Cookie"] = cookies1 + ';' + cookies3
# end
# request5.perform

File.open('./cookies' , 'w') { |file| file << cookies1 + ';' + cookies3 }
