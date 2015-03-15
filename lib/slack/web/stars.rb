# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the stars methods.
    module Stars
      # Endpoint scope
      SCOPE = "stars"

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
      def stars_list(params={})
        response = @session.do_get "#{SCOPE}.list", params
        Slack::parse_response(response)
      end

    end
  end
end
