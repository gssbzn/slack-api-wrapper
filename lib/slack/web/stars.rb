# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the stars methods.
    module Stars
      # Endpoint scope
      SCOPE = 'stars'

      # This method adds a star to an item (message, file, file comment,
      # channel, private group, or DM) on behalf of the authenticated user.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'file'
      #   File to add star to.
      # @option params [Object] 'file_comment'
      #   File comment to add star to.
      # @option params [Object] 'channel'
      #  	Channel to add star to, or channel where the message to add star to was posted
      # @option params [Object] 'timestamp'
      #   Timestamp of the message to add star to.
      #
      # @see https://api.slack.com/methods/stars.add
      def stars_add(params = {})
        response = @session.do_post "#{SCOPE}.add", params
        Slack.parse_response(response)
      end
      # Lists stars for a user.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [user] 'user'
      #   Show stars by this user. Defaults to the authed user.
      # @option params [Object] 'count'
      #   Number of items to return per page.
      # @option params [Object] 'page'
      #   Page number of results to return.
      #
      # @see https://api.slack.com/methods/stars.list
      def stars_list(params = {})
        response = @session.do_post "#{SCOPE}.list", params
        Slack.parse_response(response)
      end

      # This method removes a star from an item (message, file, file comment,
      # channel, private group, or DM) on behalf of the authenticated user.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'file'
      #   File to remove star from.
      # @option params [Object] 'file_comment'
      #   File comment to remove star from.
      # @option params [Object] 'channel'
      #  	Channel to remove star from, or channel where the message to remove star from was posted.
      # @option params [Object] 'timestamp'
      #   Timestamp of the message to remove star from.
      #
      # @see https://api.slack.com/methods/stars.remove
      def stars_remove(params = {})
        response = @session.do_post "#{SCOPE}.remove", params
        Slack.parse_response(response)
      end
    end
  end
end
