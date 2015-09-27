# Copyright (c) 2015 Gustavo Bazan
# MIT License

module Slack
  module Web
    # Module for the auth methods.
    module Auth
      # Endpoint scope
      SCOPE = 'auth'

      # Checks authentication & identity.
      #
      # @param [Hash] params
      #   API call arguments
      #
      # @see https://api.slack.com/methods/auth.test
      def auth_test(params = {})
        response = @session.do_post "#{SCOPE}.test", params
        Slack.parse_response(response)
      end
    end
  end
end
