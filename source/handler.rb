def get_item(row)
  name = row.xpath('.//td[1]/a/@title').text
  desc = row.xpath('.//td[3]').text
  {name: name, desc: desc}
end

