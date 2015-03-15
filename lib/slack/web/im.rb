module Slack
  module Web
    module Im
      SCOPE = "im"

      # Close a direct message channel.
      def im_close(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.close", params
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from direct message channel.
      def im_history(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.history", params
        Slack::parse_response(response)
      end

      # Lists direct message channels for the calling user.
      def im_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Sets the read cursor in a direct message channel.
      def im_mark(params={})
        throw ArgumentError.new("Required arguments :channel missing") if params['channel'].nil?
        throw ArgumentError.new("Required arguments :ts missing") if params['ts'].nil?
        response = @session.do_get "#{SCOPE}.mark", params
        Slack::parse_response(response)
      end

      # Opens a direct message channel.
      def im_open(params={})
        throw ArgumentError.new("Required arguments :user missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.open", params
        Slack::parse_response(response)
      end

    end
  end
end
