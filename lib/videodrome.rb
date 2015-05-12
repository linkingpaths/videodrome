require "videodrome/version"
require "videodrome/errors/invalid_url"
require "videodrome/errors/request_error"
require "videodrome/connection"
require "videodrome/video"
require "videodrome/url"

require "faraday"
require "json"

# nodoc
module Videodrome
  def self.connection
    @connection ||= Videodrome::Connection.new
  end
end
