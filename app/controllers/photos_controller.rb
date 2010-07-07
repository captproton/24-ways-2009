class PhotosController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=300'
  end

  def show
    response.headers['Cache-Control'] = 'public, max-age=300'
    if params[:photo_id]
      # params are given by the home index
      @photo_url = 'http://farm'+ params[:farm] + '.static.flickr.com/' + params[:server]         + '/'         + params[:photo_id]         + '_'         + params[:secret]         + '_z_d.jpg'
      
      # @source = URI.unescape(source_param)
    else
      @photo_url = "http://flickr.com"
    end
    
    flickrQuery = 'select farm,id,owner,secret,server,title from flickr.photos.search where user_id="11414938@N00"'
    
    @photo = ""
  end

end
