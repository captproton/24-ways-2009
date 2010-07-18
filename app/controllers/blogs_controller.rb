class BlogsController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=300'
    yql_query = 'select * from rss where url="http://feeds.feedburner.com/wait-till-i/gwZf"'
    @blogs = Blog.get_all( yql_query )
    
    # blogQuery = 'select * from rss where url="http://feeds.feedburner.com/wait-till-i/gwZf"'
    
    # @blogs = yql_search(blogQuery).first
  end

  def show
    response.headers['Cache-Control'] = 'public, max-age=300'
    if params[:source]
      source_param = params[:source]
      source_param = URI.unescape(source_param)
      blog_item = 'select * from rss where url="http://feeds.feedburner.com/wait-till-i/gwZf" and link like "%' + source_param +'%"'
      @source = URI.unescape(source_param)
      @blog = Blog.get_by_link(@source)
      
      # @blog = yql_search(blogQuery).first.second
      ## @blog = Blog.find(params[:id])
      
      
    else
      @source = "/"
    end
  end
  
  

end
