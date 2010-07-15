class FeedsController < ApplicationController
  # see http://paulsturgess.co.uk/articles/show/13-creating-an-rss-feed-in-ruby-on-rails
  def index
    response.headers['Cache-Control'] = 'public, max-age=300'
    @feeds = Feed.all
  end
  
  def show
    @feed = Feed.find(params[:id])

  end
  
  def new
    @feed = Feed.new
  end
  
  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash[:notice] = "Successfully created feed."
      redirect_to @feed
    else
      render :action => 'new'
    end
  end
  
  def edit
    @feed = Feed.find(params[:id])
  end
  
  def update
    @feed = Feed.find(params[:id])
    if @feed.update_attributes(params[:feed])
      flash[:notice] = "Successfully updated feed."
      redirect_to @feed
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    flash[:notice] = "Successfully destroyed feed."
    redirect_to feeds_url
  end
  
  def rss
    @feed_items = yql_search(yql_query).first.second.third.first.second
    @feed = Feed.find(params[:id])
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
end
