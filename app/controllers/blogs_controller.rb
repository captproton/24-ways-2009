class BlogsController < ApplicationController
  def index
    blogQuery = 'select * from rss where url="http://feeds.feedburner.com/wait-till-i/gwZf"'
    
    @blogs = yql_search(blogQuery).first
  end

  def show
    if params[:source]
      source_param = params[:source]
      source_param = URI.unescape(source_param)
      blogQuery = 'select * from rss where url="http://feeds.feedburner.com/wait-till-i/gwZf" and link like "%http://feedproxy.google.com/~r/wait-till-i/gwZf/~3/BSsZMK_29EY%"'
      
      @blog = yql_search(blogQuery).first.second
      #@blog = Blog.find(params[:id])
      
      
      @source = URI.unescape(source_param)
    else
      @source = "/"
    end
  end
  
  

end
