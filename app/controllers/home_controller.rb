class HomeController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=300'
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


  def undoYouTubeMarkupCrimes(string)
    cleaner  = string.gsub('/555px/','100%')
    cleaner += cleaner.gusb('/width="[^"]+"/','')
    cleaner += cleaner.gsub('/<tbody>/','<colgroup><col width="20%"><col width="50%"><col width="30%"></colgroup><tbody>')
    return cleaner
  end
end
