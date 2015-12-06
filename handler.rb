def get_item(row)
  name = row.xpath('.//td[1]/a/@title').text
  desc = row.xpath('.//td[3]').text
  {name: name, desc: desc}
end

def get_html(url)
  c = Curl::Easy.new(url) do |request|
    request.headers["User-Agent"] = 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:39.0) Gecko/20100101 Firefox/39.0'
    request.headers["Cookie"] = File.open('./cookies') { |file| file.read }
  end
  c.perform
  Nokogiri::HTML(c.body)
end
