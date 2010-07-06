# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

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

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
