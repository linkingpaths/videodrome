require "ostruct"
require "time"

module Videodrome
  # Video wrapper for Youtube info
  class Video
    attr_reader :id, :raw_data, :snippet, :details, :player, :status

    def initialize(url, options = {})
      @url = URL.new(url)
      @id = @url.id
      @raw_data = Videodrome.connection.get(options.merge(:id => @id))
      parse_raw_data
    end

    def published_at
      Time.iso8601(snippet.publishedAt)
    end

    def title
      snippet.title
    end

    def description
      snippet.description
    end

    def thumbnails
      snippet.thumbnails
    end

    def thumbnail(size = "standard")
      thumbnails[size]
    end

    def embed_html
      player.embedHtml if embeddable
    end

    def duration
      details.duration
    end

    def embeddable
      status.embeddable
    end

    protected

    def parse_raw_data
      raise Videodrome::Errors::RequestError, @raw_data["error"]["message"] if @raw_data["error"]
      item = @raw_data["items"][0]
      @snippet = OpenStruct.new(item["snippet"])
      @details = OpenStruct.new(item["contentDetails"])
      @player = OpenStruct.new(item["player"])
      @status = OpenStruct.new(item["status"])
    end
  end
end
