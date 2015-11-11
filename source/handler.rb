def get_item(row)
  name = row.xpath('.//td[1]/a/@title').text
  img_url = row.xpath('.//td[2]/a/img/@src').text
  desc = row.xpath('.//td[3]').text
  {name: name, img_url: img_url, desc: desc}
end

