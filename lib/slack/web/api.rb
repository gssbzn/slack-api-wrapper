# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the api methods.
    module Api
      # Endpoint scope
      SCOPE = "api"

      # Checks API calling code.
      #
      # @param [Hash] params
      #   API call arguments
      # @option params [Object] 'error'
      #   Error response to return
      # @option params [Object] 'foo'
      #   example property to return
      #
      # @see https://api.slack.com/methods/api.test
      def api_test(params={})
        response = @session.do_get "#{SCOPE}.test", params
        Slack::parse_response(response)
      end

    end
  end
end
