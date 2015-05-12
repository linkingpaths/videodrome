module Videodrome
  # ID extraction utility class for Youtube video URLs
  class URL
    def initialize(url)
      @url = url
      match_url(url)
    end

    def id
      @match_data[1]
    end

    protected

    def match_url(url)
      found = patterns.find do |pattern|
        @match_data = url.match(pattern)
      end
      raise Videodrome::Errors::InvalidURL unless found
    end

    def patterns
      prefix = "^(?:https?://)?(?:www\.)?"
      suffix = "(?:|/)"
      video_id = "([a-zA-Z0-9_-]+)"
      domains = ["youtube\\.com/watch\\?v=#{video_id}", "youtu\\.be/#{video_id}"]
      domains.map { |domain| %r{#{prefix}#{domain}#{suffix}} }
    end
  end
end
