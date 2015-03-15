# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the im methods.
    # Get info on your direct messages.
    module Im
      # Endpoint scope
      SCOPE = "im"

      # Close a direct message channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [im] 'channel'
      #   Direct message channel to close.
      #
      # @see https://api.slack.com/methods/im.close
      def im_close(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.close", params
        Slack::parse_response(response)
      end

      # Fetches history of messages and events from direct message channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [im] 'channel'
      #   Direct message channel to fetch history for.
      # @option params [timestamp] 'latest'
      #   Latest message timestamp to include in results.
      # @option params [timestamp] 'oldest'
      #   Oldest message timestamp to include in results.
      # @option params [Object] 'inclusive'
      #   Include messages with latest or oldest timestamp in results.
      # @option params [Object] 'count'
      #   Number of messages to return, between 1 and 1000.
      #
      # @see https://api.slack.com/methods/im.history
      def im_history(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        response = @session.do_get "#{SCOPE}.history", params
        Slack::parse_response(response)
      end

      # Lists direct message channels for the calling user.
      #
      # @param [Hash] params
      #   API call arguments
      #
      # @see https://api.slack.com/methods/im.list
      def im_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

      # Sets the read cursor in a direct message channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [im] 'channel'
      #   Direct message channel to set reading cursor in.
      # @option params [timestamp] 'ts'
      #   Timestamp of the most recently seen message.
      #
      # @see https://api.slack.com/methods/im.mark
      def im_mark(params={})
        raise ArgumentError.new("Required arguments 'channel' missing") if params['channel'].nil?
        raise ArgumentError.new("Required arguments 'ts' missing") if params['ts'].nil?
        response = @session.do_get "#{SCOPE}.mark", params
        Slack::parse_response(response)
      end

      # Opens a direct message channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [user] 'user'
      #   User to open a direct message channel with.
      #
      # @see https://api.slack.com/methods/im.open
      def im_open(params={})
        raise ArgumentError.new("Required arguments 'user' missing") if params['user'].nil?
        response = @session.do_get "#{SCOPE}.open", params
        Slack::parse_response(response)
      end

    end
  end
end
