module Videodrome
  # Connection class to make the requests to Youtube API.
  class Connection
    API_SERVER  = "https://www.googleapis.com"
    API_SERVICE = "youtube"
    API_VERSION = "v3"

    def get(params = {})
      defaults = {
        :part => "snippet,player,contentDetails,status"
      }
      defaults[:key] = ENV["VIDEODROME_YOUTUBE_API_KEY"] if ENV["VIDEODROME_YOUTUBE_API_KEY"]
      response = connection.get(search_path, defaults.merge(params))
      JSON.parse(response.body)
    end

    protected

    def connection
      @connection ||= Faraday.new(:url => API_SERVER) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger if ENV["VIDEODROME_DEBUG"]
        faraday.adapter Faraday.default_adapter
      end
    end

    def search_path
      "/#{API_SERVICE}/#{API_VERSION}/videos"
    end
  end
end
