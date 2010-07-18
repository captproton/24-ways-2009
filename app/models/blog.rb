class Blog
  def self.get_all(query)
    base_url = "http://query.yahooapis.com/v1/public/yql?format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
    url = "#{base_url}&q=#{URI.encode(query)}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body

    # we convert the returned JSON data to native Ruby
    # data structure - a hash
    result = JSON.parse(data)

    # if the hash has 'Error' as a key, we raise an error
    if result.has_key? 'Error'
       raise "web service error"
    end
    return result['query']['results']['item']
  end

  def self.get_by_link(link)
    url = 'http://feeds.feedburner.com/wait-till-i/gwZf'
    #link = 'http://feedproxy.google.com/~r/wait-till-i/gwZf/~3/Yjw7ReGGwS'
    query = 'select * from rss where url="http://feeds.feedburner.com/wait-till-i/gwZf" and link like "' + '%' + link +'%' + '"'

    base_url = "http://query.yahooapis.com/v1/public/yql?format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
    url = "#{base_url}&q=#{URI.encode(query)}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body

    # we convert the returned JSON data to native Ruby
    # data structure - a hash
    result = JSON.parse(data)

    # if the hash has 'Error' as a key, we raise an error
    if result.has_key? 'Error'
       raise "web service error"
    end
    return result['query']['results']['item']

  end

end
