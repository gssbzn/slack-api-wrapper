module Slack
  module Web
    # Module for the pins methods.
    module Pins
      # Endpoint scope
      SCOPE = 'pins'

      # This method pins an item (file, file comment, channel message,
      # or group message) to a particular channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'channel'
      #  	Channel to pin the item in.
      # @option params [Object] 'file'
      #   File to pin.
      # @option params [Object] 'file_comment'
      #   File comment to pin.
      # @option params [Object] 'timestamp'
      #   Timestamp of the message to pin.
      #
      # @see https://api.slack.com/methods/pins.add
      def pins_add(params = {})
        fail ArgumentError, "Required arguments 'channel' missing" if params['channel'].nil?
        response = @session.do_post "#{SCOPE}.add", params
        Slack.parse_response(response)
      end

      # This method lists the items pinned to a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'channel'
      #  	Channel to get pinned items for.
      #
      # @see https://api.slack.com/methods/pins.list
      def pins_list(params = {})
        fail ArgumentError, "Required arguments 'channel' missing" if params['channel'].nil?
        response = @session.do_post "#{SCOPE}.list", params
        Slack.parse_response(response)
      end

      # This method un-pins an item (file, file comment, channel message,
      # or group message) from a channel.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'channel'
      #  	Channel to pin the item in.
      # @option params [Object] 'file'
      #   File to pin.
      # @option params [Object] 'file_comment'
      #   File comment to pin.
      # @option params [Object] 'timestamp'
      #   Timestamp of the message to pin.
      #
      # @see https://api.slack.com/methods/pins.remove
      def pins_remove(params = {})
        fail ArgumentError, "Required arguments 'channel' missing" if params['channel'].nil?
        response = @session.do_post "#{SCOPE}.remove", params
        Slack.parse_response(response)
      end
    end
  end
end
