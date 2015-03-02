module Slack
  module Web
    module Im
      SCOPE = "im"

      # Close a direct message channel.
      def im_close(channel)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Fetches history of messages and events from direct message channel.
      def im_history(channel, latest, oldest, inclusive, count)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Lists direct message channels for the calling user.
      def im_list
        response = @session.do_get "#{SCOPE}.list"
        Slack::parse_response(response)
      end

      # Sets the read cursor in a direct message channel.
      def im_mark(channel, ts)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

      # Opens a direct message channel.
      def im_open(user)
        raise NotImplementedError.new("Not yet implemented, feel free to make a pull request")
      end

    end
  end
end
