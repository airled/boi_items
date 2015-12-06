def get_item(row)
  name = row.xpath('.//td[1]/a/@title').text
  desc = row.xpath('.//td[3]').text
  {name: name, desc: desc}
end

def get_html(url)
  c = Curl::Easy.new(url) do |request|
    request.headers["Cookie"] = File.open('./cookies') { |file| file.read }
  end
  c.perform
  Nokogiri::HTML(c.body)
end
