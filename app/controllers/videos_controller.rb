class VideosController < ApplicationController
  def index
    
  end

  def show
    if params[:videoid]
      video_param = params[:videoid]
      @videoid = URI.unescape(video_param)
      youtube_query = 'select * from feed(5) where url="http://gdata.youtube.com/feeds/api/users/chrisheilmann/uploads?v=2" and group.videoid="'+ @videoid +'"'
      youtube_stream = 'select * from feed(5) where url="http://gdata.youtube.com/feeds/api/users/chrisheilmann/uploads?v=2" and group.videoid="'+ @videoid +'"'
      @video = yql_search(youtube_query).first.second
      @videos = yql_search(youtube_stream).first.second

    else
      @source = "/"
    end
    
    videoid = params[:videoid]

    @youtube_id = yql_search(youtube_query).first.second['group']['videoid']
  end

end
