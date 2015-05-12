module Videodrome
  module Errors
    # :nodoc
    class InvalidURL < StandardError
      def message
        "The URL provided is not a valid Youtube Video URL."
      end
    end
  end
end
