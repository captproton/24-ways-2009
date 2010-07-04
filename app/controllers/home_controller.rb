class HomeController < ApplicationController
  def index
    # YouTube RSS
    youtubeQuery = 'select * from feed(5) where url="http://gdata.youtube.com/feeds/api/users/chrisheilmann/uploads?v=2"'
    ##url="http://gdata.youtube.com/feeds/base/users/chrisheilmann/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile";'
    
    ## Flickr search by user id */
    flickrQuery = 'select farm,id,owner,secret,server,title from flickr.photos.search where user_id="11414938@N00"'

    ## Delicious RSS */
    deliciousQuery = 'select title,link from rss where url="http://feeds.delicious.com/v2/rss/codepo8?count=10"'

    ## Blog RSS */
    blogQuery = 'select title,link from rss where url="http://feeds.feedburner.com/wait-till-i/gwZf"'

    
    ## Assemble the query */
    ## missing youtubeQuery + ';'  +
    yql_query = "select * from query.multi where queries='" +    flickrQuery + ';' + deliciousQuery + ';' +  blogQuery + ';' + youtubeQuery  + "'"
    ## yql_basick = "select * from flickr.photos.search where text='Cat' limit 10"

    
    ################
    @videos = yql_search(yql_query).first.second.fourth.first.second
    
    @photos = yql_search(yql_query).first.second.first.first.second ##yql_search(yql_query).first.first.second
    @links = yql_search(yql_query).first.second.second.first.second
    @blog_articles = yql_search(yql_query).first.second.third.first.second
    
  end

  def yql_search(query)
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
     ## @blogs = 
     return result['query']['results']
  end

  def undoYouTubeMarkupCrimes(string)
    cleaner  = string.gsub('/555px/','100%')
    cleaner += cleaner.gusb('/width="[^"]+"/','')
    cleaner += cleaner.gsub('/<tbody>/','<colgroup><col width="20%"><col width="50%"><col width="30%"></colgroup><tbody>')
    return cleaner
  end
end
